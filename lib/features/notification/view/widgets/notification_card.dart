import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../core/constant/app_color.dart';
import '../../../../core/constant/app_size_box.dart';
import '../../../../core/constant/app_text_styles.dart';

class NotificationCard extends StatelessWidget {
  final String? image;
  final String? title;
  final String? time;
  final String? content;
  const NotificationCard({
    super.key, this.image, this.title, this.time, this.content,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 10),
      margin: const EdgeInsets.symmetric(vertical: 10.0),
      width: double.infinity,
      decoration: BoxDecoration(
        color: AppColor.input.withAlpha(10),
        borderRadius: BorderRadius.circular(10.r),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: 48.0,
            width: 48.0,
            decoration: BoxDecoration(
              color: AppColor.input.withAlpha(20),
              shape: BoxShape.circle,
            ),
            child: Center(
              child: Image.asset(
                image ?? "",
                height: 24.0,
                width: 24.0,
                color: AppColor.main,
              ),
            ),
          ),

          AppSizeBox.width10,

          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Expanded(
                      child: Text(
                        title ?? "",
                        style: AppTextStyles.size16w400(color: Colors.white),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                    Text(
                      time ?? "",
                      style: AppTextStyles.size14w400(color: AppColor.label),
                    ),
                  ],
                ),

                AppSizeBox.height5,

                Text(
                  content ?? "",
                  style: AppTextStyles.size14w600(color: AppColor.input),
                  maxLines: 3,
                  overflow: TextOverflow.ellipsis,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}