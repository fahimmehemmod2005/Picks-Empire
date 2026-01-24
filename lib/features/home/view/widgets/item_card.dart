import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/constant/app_color.dart';
import '../../../../core/constant/app_size_box.dart';
import '../../../../core/constant/app_text_styles.dart';

class ItemCard extends StatelessWidget {
  final String? image;
  final String? title;
  final String? rate;
  final String? description;
  final String? picks;

  const ItemCard({
    super.key,
    this.image,
    this.title,
    this.rate,
    this.description,
    this.picks,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 5),
      padding: const EdgeInsets.all(10),
      width: double.infinity,
      decoration: BoxDecoration(
        color: AppColor.input.withAlpha(10),
        borderRadius: BorderRadius.circular(12.r),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          AspectRatio(
            aspectRatio: 16 / 9,
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5.r),
                image: DecorationImage(
                  image: AssetImage(image ?? ""),
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),

          AppSizeBox.height10,

          Row(
            children: [
              Text(
                title ?? "",
                style: AppTextStyles.size28w500(color: Colors.white),
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
              AppSizeBox.width10,
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 8),
                height: 28.h,
                decoration: BoxDecoration(
                  color: const Color(0xffB0FCD4),
                  borderRadius: BorderRadius.circular(5.r),
                ),
                child: Center(
                  child: Text(
                    rate ?? "",
                    style: AppTextStyles.size14w400(
                      color: const Color(0xff008640),
                    ),
                  ),
                ),
              ),
            ],
          ),

          AppSizeBox.height10,

          Text(
            description ?? "",
            style: AppTextStyles.size14w400(color: const Color(0xffA5A5AB)),
            maxLines: 3,
            overflow: TextOverflow.ellipsis,
          ),

          AppSizeBox.height10,

          Container(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            height: 24.h,
            width: 120.0.w,
            decoration: BoxDecoration(
              color: const Color(0xff707070).withAlpha(70),
              borderRadius: BorderRadius.circular(5.r),
            ),
            child: Center(
              child: Text(
                picks ?? "",
                style: AppTextStyles.size14w400(color: Colors.white),
              ),
            ),
          ),
        ],
      ),
    );
  }
}