import 'package:flutter/material.dart';
import '../../core/constant/app_color.dart';
import '../../core/constant/app_size_box.dart';
import '../../core/constant/app_text_styles.dart';

class TitleSubtitleBar extends StatelessWidget {
  final String? title;
  final String? subtitle;
  const TitleSubtitleBar({super.key, this.title, this.subtitle});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title ?? "",
          style: AppTextStyles.size24w700(color: AppColor.title),
        ),
        AppSizeBox.height5,
        Text(
          subtitle ?? "",
          style: AppTextStyles.size14w400(color: AppColor.title),
        ),
      ],
    );
  }
}
