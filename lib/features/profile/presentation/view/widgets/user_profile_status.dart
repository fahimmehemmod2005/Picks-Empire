import 'package:fdahunter/core/constant/app_color.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../../core/constant/app_images.dart';
import '../../../../../core/constant/app_size_box.dart';
import '../../../../../core/constant/app_text_styles.dart';

class UserProfileStatus extends StatelessWidget {
  const UserProfileStatus({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          height: 65,
          width: 50,
          decoration: BoxDecoration(color: Colors.transparent),
          child: Stack(
            children: [
               Container(
            height: 60.0.h,
            width: 60.0.w,
            decoration: BoxDecoration(
              color: Colors.blue,
              shape: BoxShape.circle,
              image: DecorationImage(image: AssetImage(AppImages.fahim),fit: BoxFit.cover)
            ),
          ),
              Positioned(
                top: 40,
                left: 3,
                child: Container(
                  height: 23.0,
                  width: 45.0,
                  decoration: BoxDecoration(
                    color: AppColor.main,
                    borderRadius: BorderRadius.circular(10.0.r),
                  ),
                  child: Center(
                    child: Text(
                      'VIP',
                      style: TextStyle(color: Colors.black),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
        AppSizeBox.width15,
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'MD. Fahim Mehemmod',
              style: AppTextStyles.size16w700(color: Colors.white),
            ),
            AppSizeBox.height5,
            Text(
              '@fahim2005',
              style: AppTextStyles.size14w600(color: AppColor.label),
            ),
          ],
        ),
      ],
    );
  }
}