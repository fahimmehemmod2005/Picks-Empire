import 'package:fdahunter/app/widgets/my_scaffold.dart';
import 'package:fdahunter/core/constant/app_images.dart';
import 'package:fdahunter/core/constant/app_size_box.dart';
import 'package:flutter/material.dart';
import '../../../../core/constant/app_color.dart';
import '../../../../core/constant/app_text_styles.dart';
import '../widgets/sports_pick_card.dart';

class SportsPicksScreen extends StatefulWidget {
  const SportsPicksScreen({super.key});

  @override
  State<SportsPicksScreen> createState() => _SportsPicksScreenState();
}

class _SportsPicksScreenState extends State<SportsPicksScreen> {
  @override
  Widget build(BuildContext context) {
    return MyScaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Sports Picks',
                        style: AppTextStyles.size24w700(color: Colors.white),
                      ),
                      Text(
                        '12 active picks',
                        style: AppTextStyles.size14w600(color: AppColor.input),
                      ),
                    ],
                  ),
                  Spacer(),
                  IconButton(
                    style: IconButton.styleFrom(
                      backgroundColor: AppColor.input.withAlpha(10),
                    ),
                    icon: Icon(
                      Icons.notifications_off_outlined,
                      color: AppColor.main,
                    ),
                    onPressed: () {},
                  ),
                ],
              ),
              AppSizeBox.height15,
              Text(
                "Live Picks",
                style: AppTextStyles.size28w500(color: AppColor.title),
              ),
              Expanded(
                child: ListView.builder(
                  itemCount: 10,
                  itemBuilder: (context, index) {
                    return SportsPickCard(
                      icon: AppImages.crown,
                      dateTime: "10/23/2025 4:46 AM",
                      content:
                          "We predict Man City to win based on home advantage, xG, and injuries.",
                    );
                  },
                ),
              ),
              AppSizeBox.height10,
            ],
          ),
        ),
      ),
    );
  }
}
