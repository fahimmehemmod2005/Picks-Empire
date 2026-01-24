import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../core/constant/app_color.dart';
import '../../../../core/constant/app_size_box.dart';
import '../../../../core/constant/app_text_styles.dart';

class FeaturesList extends StatelessWidget {
  const FeaturesList({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(15.r),
      width: double.infinity,
      decoration: BoxDecoration(
        color: AppColor.input.withAlpha(10),
        borderRadius: BorderRadius.circular(10.r),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            'The Features you’ll get',
            style: AppTextStyles.size18w700(color: Colors.white),
          ),
          AppSizeBox.height10,
          _featureItem("Man City last 5: W W W D W (avg xG 2.1)"),
          _featureItem("Arsenal missing LB — conceded 1.4 goals avg without him",),
          _featureItem("Head-to-head last 10: City 6 / Arsenal 2 / Draw 2",),
          _featureItem("Home advantage: 78% win rate at Etihad this season",),
        ],
      ),
    );
  }
}
// ------------------ feature item ----------------
Widget _featureItem(String text) {
  return Padding(
    padding: EdgeInsets.only(bottom: 10),
    child: Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Icon(
          Icons.lightbulb_outline_rounded,
          color: AppColor.main,
          size: 20,
        ),

        SizedBox(width: 8.w),
        Expanded(
          child: Text(
            text,
            style: AppTextStyles.size16w400(color: Colors.white),
            softWrap: true,
          ),
        ),
      ],
    ),
  );
}

// ------------------- payment --------------------