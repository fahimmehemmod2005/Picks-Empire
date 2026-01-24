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
      padding: EdgeInsets.all(15.0),
      width: double.infinity.w,
      decoration: BoxDecoration(
        color: AppColor.main,
        borderRadius: BorderRadius.circular(10.0.r),
      ),
      child: Column(
        children: [
          Row(
            children: [
              Image.asset(
                AppImages.crown,
                color: Colors.orangeAccent,
                height: 50.0,
                width: 50.0,
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
                    Text(
                      "2 days remaining - Join 10K + winners",
                      style: AppTextStyles.size14w400(
                        color: Color(0xff4A4C56),
                      ),
                    ),
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
          AppSizeBox.height10,
          MainButton(
            backgroundColor: Color(0xff0F1016),
            label: "Unlock Full Access - \$99/month",
            style: AppTextStyles.size16w700(color: AppColor.main),
            onTap: () {},
          ),
        ],
      ),
    );
  }
}
