import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import '../../core/constant/app_color.dart';
import '../../core/constant/app_text_styles.dart';

class CustomRichText extends StatelessWidget {
  final String? text1;
  final String? text2;
  final String? text3;
  final String? text4;
  final String? text5;
  final String? text6;
  final TextStyle? style1;
  final TextStyle? style2;
  final TextStyle? style3;
  final TextStyle? style4;
  final TextStyle? style5;
  final TextStyle? style6;
  final void Function()? text2Tap;
  final void Function()? text4Tap;
  final void Function()? text6Tap;

  const CustomRichText({
    super.key,
    this.text1,
    this.text2,
    this.text3,
    this.text4,
    this.text5,
    this.text6,
    this.style1,
    this.style2,
    this.style3,
    this.style4,
    this.style5,
    this.style6,
    this.text2Tap,
    this.text4Tap,
    this.text6Tap,
  });

  @override
  Widget build(BuildContext context) {
    return RichText(
      text: TextSpan(
        children: [
          TextSpan(
            text: text1,
            style: style1 ?? AppTextStyles.size16w700(color: AppColor.label),
          ),
          TextSpan(
            text: text2,
            style: style2 ?? AppTextStyles.size16w700(color: AppColor.main),
            recognizer: TapGestureRecognizer()..onTap = text2Tap,
          ),
          TextSpan(
            text: text3,
            style: style3 ?? AppTextStyles.size14w400(color: AppColor.label),
          ),
          TextSpan(
            text: text4,
            style: style3 ?? AppTextStyles.size14w400(color: AppColor.label),
            //recognizer: TapGestureRecognizer()..onTap = text4Tap,
          ),
          TextSpan(
            text: text5,
            style: style5 ?? AppTextStyles.size14w400(color: AppColor.label),
          ),
          TextSpan(
            text: text6,
            style: style6 ?? AppTextStyles.size14w400(color: AppColor.label),
            //recognizer: TapGestureRecognizer()..onTap = text6Tap,
          ),
        ],
      ),
    );
  }
}