import 'package:fdahunter/app/routes/route_name.dart';
import 'package:fdahunter/app/widgets/main_button.dart';
import 'package:fdahunter/app/widgets/my_scaffold.dart';
import 'package:fdahunter/app/widgets/title_subtitle_bar.dart';
import 'package:fdahunter/core/constant/app_color.dart';
import 'package:fdahunter/core/constant/app_size_box.dart';
import 'package:fdahunter/core/constant/app_text_styles.dart';
import 'package:fdahunter/features/auth/presentation/viewmodel/category_view_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CategoryScreen extends StatelessWidget {
  const CategoryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final categories = [
      'Sports',
      'Stocks',
      'Crypto',
      'Casino',
    ];
    return MyScaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: Consumer<CategoryViewModel>(
            builder: (context, provider, child) {
              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  AppSizeBox.height50,
                  const TitleSubtitleBar(
                    title: "Which categories do you like?",
                    subtitle: "You can select up to 3",
                  ),
                  AppSizeBox.height25,

                  Wrap(
                    spacing: 10,
                    runSpacing: 5,
                    children: categories.map((category) {
                      final bool isSelected = provider.isSelected(category);
                      return FilterChip(
                        label: Text(category),
                        selected: isSelected,
                        onSelected: (_) {
                          provider.toggleCategory(context, category.toString().trim());
                        },
                        showCheckmark: false,
                        backgroundColor: const Color(0xFF1E2A1E), // dark chip
                        selectedColor: AppColor.main, // green selected
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12.0),
                          side: BorderSide(
                            color: isSelected
                                ? AppColor.main
                                : Colors.white.withOpacity(0.15),
                            width: 1,
                          ),
                        ),
                        labelStyle: AppTextStyles.size16w400(
                          color: isSelected ? Colors.black : Colors.white70,
                        ),
                      );
                    }).toList(),
                  ),


                  AppSizeBox.height25,

                  MainButton(
                    label: 'Continue',
                    onTap: () {
                      if (!provider.canContinue()) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: const Text(
                              'Please select at least one category',
                              style: TextStyle(
                                fontSize: 16,
                                color: Colors.black,
                              ),
                            ),
                            backgroundColor: AppColor.main,
                            duration: const Duration(seconds: 2),
                            behavior: SnackBarBehavior.floating,
                            margin: const EdgeInsets.all(16),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12),
                            ),
                          ),
                        );
                        return;
                      }
                      Navigator.pushReplacementNamed(
                        context,
                        RouteName.loginScreen,
                      );
                      print(provider.selectedCategories.toString());
                    },
                  ),
                  AppSizeBox.height10
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}
