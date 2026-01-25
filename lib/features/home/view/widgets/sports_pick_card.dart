import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../core/constant/app_color.dart';
import '../../../../core/constant/app_size_box.dart';
import '../../../../core/constant/app_text_styles.dart';

class SportsPickCard extends StatelessWidget {
  final String? icon;
  final String? dateTime;
  final String? content;
  const SportsPickCard({super.key, this.icon, this.dateTime, this.content});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10.0),
      padding: EdgeInsets.all(15.0),
      width: double.infinity.w,
      decoration: BoxDecoration(
        color: AppColor.input.withAlpha(10),
        borderRadius: BorderRadius.circular(10.0.r),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Row(
            children: [
              Image.asset(
                icon ?? "",
                color: AppColor.main,
                height: 24.0,
                width: 24.0,
              ),
              AppSizeBox.width5,
              Text(
               dateTime ?? "",
                style: AppTextStyles.size14w400(color: AppColor.label),
              ),
            ],
          ),
          AppSizeBox.height5,
          Text(
            content ?? "",
            style: AppTextStyles.size14w400(color: AppColor.title),
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
          ),
        ],
      ),
    );
  }
}
