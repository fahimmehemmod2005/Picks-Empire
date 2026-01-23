import 'package:fdahunter/app/widgets/main_button.dart';
import 'package:fdahunter/core/constant/app_color.dart';
import 'package:fdahunter/core/constant/app_images.dart';
import 'package:fdahunter/core/constant/app_size_box.dart';
import 'package:fdahunter/core/constant/app_text_styles.dart';
import 'package:fdahunter/features/onboarding/viewmodel/onboarding_view_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

class OnboardingScreen extends StatelessWidget {
  const OnboardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var onboarding = [
      {
        'image': AppImages.onboarding1,
        'title': 'Elite Sports Picks. AI-Driven. Pro-Verified.',
        'subtitle':
            'AI-powered predictions refined by expert analysts for maximum accuracy.',
      },
      {
        'image': AppImages.onboarding2,
        'title': 'Premium Crypto Setups. High-Accuracy, High-Reward.',
        'subtitle':
            'AI-filtered plays with expert confirmation and clear risk levels and profit targets.',
      },
      {
        'image': AppImages.onboarding3,
        'title': 'High Accuracy Stock Plays. Only Premium Setups.',
        'subtitle':
            'Ultra-selective trades filtered by AI, confirmed by professionals, and delivered with clear targets.',
      },
      {
        'image': AppImages.onboarding4,
        'title': 'Beat the Machines. Smartest Slot Entry Points.',
        'subtitle':
            'Smart data identifies slot machines with the highest bonus potential right now.',
      },
    ];

    return Consumer<OnboardingViewModel>(
      builder: (context, provider, child) {
        return Scaffold(
          body: Stack(
            children: [
              // PageView
              PageView.builder(
                controller: provider.pageController,
                itemCount: onboarding.length,
                onPageChanged: provider.onPageChanged,
                itemBuilder: (context, index) {
                  return Image.asset(
                    onboarding[index]['image']!,
                    fit: BoxFit.cover,
                  );
                },
              ),

              // Bottom content
              SafeArea(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Text(
                        onboarding[provider.currentIndex]['title']!,
                        textAlign: TextAlign.center,
                        style: AppTextStyles.size28w600(color: Colors.white),
                      ),

                      Text(
                        onboarding[provider.currentIndex]['subtitle']!,
                        textAlign: TextAlign.center,
                        style: AppTextStyles.size14w400(color: Colors.white70),
                      ),

                      AppSizeBox.height20,

                      // Indicator
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: List.generate(
                          onboarding.length,
                          (index) => AnimatedContainer(
                            duration: const Duration(milliseconds: 300),
                            margin: const EdgeInsets.symmetric(horizontal: 4),
                            height: 8.h,
                            width: provider.currentIndex == index ? 26.w : 8.w,
                            decoration: BoxDecoration(
                              color: provider.currentIndex == index
                                  ? AppColor.main
                                  : Colors.white38,
                              borderRadius: BorderRadius.circular(20),
                            ),
                          ),
                        ),
                      ),

                      AppSizeBox.height20,

                      // Button
                      MainButton(
                        label: provider.currentIndex == onboarding.length - 1
                            ? "Get Started"
                            : "Continue",
                        borderRadius: 30,
                        onTap: () {
                          provider.nextPage(onboarding.length, context);
                        },
                      ),

                      AppSizeBox.height10,
                    ],
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
