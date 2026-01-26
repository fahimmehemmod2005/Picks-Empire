import 'package:fdahunter/app/routes/route_name.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../app/widgets/main_button.dart';
import '../../../../core/constant/app_color.dart';
import '../../../../core/constant/app_images.dart';
import '../../../../core/constant/app_size_box.dart';
import '../../../../core/constant/app_text_styles.dart';

class FreeTrailActiveCard extends StatelessWidget {
  const FreeTrailActiveCard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(15.w),
      width: double.infinity,
      decoration: BoxDecoration(
        color: AppColor.main,
        borderRadius: BorderRadius.circular(10.r),
      ),
      child: Column(
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Image.asset(
                AppImages.crown,
                color: Colors.orangeAccent,
                height: 45.h,
                width: 45.w,
                fit: BoxFit.contain,
              ),
              AppSizeBox.width10,
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Free Trial Active',
                      style: AppTextStyles.size20w600(
                        color: AppColor.background,
                      ),
                    ),
                    SizedBox(height: 4.h),
                    Text(
                      "2 days remaining - Join 10K + winners",
                      style: AppTextStyles.size14w400(
                        color: const Color(0xff4A4C56),
                      ),
                    ),
                    SizedBox(height: 6.h),
                    Text(
                      "50% off your first sub with code:\nWELCOME50",
                      style: AppTextStyles.size14w400(
                        color: AppColor.background,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          SizedBox(height: 12.h),
          MainButton(
            backgroundColor: const Color(0xff0F1016),
            label: "Unlock Full Access - \$99/month",
            style: AppTextStyles.size16w700(color: AppColor.main),
            onTap: () {
              Navigator.pushNamed(context, RouteName.subscriptionScreen);
            },
          ),
        ],
      ),
    );
  }
}
