import 'package:fdahunter/app/routes/route_name.dart';
import 'package:fdahunter/core/constant/app_images.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

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
            Navigator.pushNamed(context, RouteName.profileScreen);
          },
          child: Container(
            height: 50.0.h,
            width: 50.0.w,
            decoration: BoxDecoration(
              color: Colors.blue,
              shape: BoxShape.circle,
              image: DecorationImage(image: AssetImage(AppImages.fahim),fit: BoxFit.cover)
            ),
          ),
        ),

        AppSizeBox.width5,

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