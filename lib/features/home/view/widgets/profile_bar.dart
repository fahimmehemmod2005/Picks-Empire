import 'package:fdahunter/app/routes/route_name.dart';
import 'package:flutter/material.dart';

import '../../../../core/constant/app_color.dart';
import '../../../../core/constant/app_size_box.dart';
import '../../../../core/constant/app_text_styles.dart';

class ProfileBar extends StatelessWidget {
  const ProfileBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        GestureDetector(
          onTap: () {
            // profile click
          },
          child: const CircleAvatar(
            radius: 22,
            backgroundColor: Colors.white,
            child: Text(
              '👨',
              style: TextStyle(fontSize: 22),
            ),
          ),
        ),

        AppSizeBox.width10,

        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Welcome Message 👋",
              style: AppTextStyles.size16w400(color: AppColor.title),
            ),
            const SizedBox(height: 2),
            Text(
              "MD FAHIM",
              style: AppTextStyles.size20w600(color: AppColor.title),
            ),
          ],
        ),

        const Spacer(),

        IconButton(
          icon: const Icon(
            Icons.notifications_outlined,
            color: Colors.white,
            size: 26,
          ),
          onPressed: () {
            Navigator.pushNamed(context, RouteName.notificationScreen);
          },
        ),
      ],
    );
  }
}