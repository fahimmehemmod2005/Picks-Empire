import 'package:fdahunter/core/constant/app_size_box.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../core/constant/app_color.dart';
import '../../core/constant/app_text_styles.dart';

class InputField extends StatelessWidget {
  final String? topLabel;
  final String? hintText;
  final IconData? icon;
  final void Function()? onSuffixTap;
  final Widget? prefixIcon;
  final EdgeInsetsGeometry? contentPadding;
  final int? maxLine;
  final TextEditingController? controller;
  final String? Function(String?)? validator;
  final bool obscureText;
  final TextInputType? keyboardType;
  final double? height;

  const InputField({
    super.key,
    this.hintText,
    this.contentPadding,
    this.maxLine,
    this.controller,
    this.topLabel,
    this.prefixIcon,
    this.validator,
    this.icon,
    this.onSuffixTap,
    this.obscureText = false, this.keyboardType, this.height,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (topLabel != null)
          Text(
            topLabel!,
            style: AppTextStyles.size14w600(color: AppColor.label),
          ),
        AppSizeBox.height5,

        Container(
          height: height,
          child: TextFormField(
            keyboardType: keyboardType,
            obscureText: obscureText,
            cursorColor: AppColor.main,
            validator: validator,
            controller: controller,
            maxLines: maxLine,
            style: const TextStyle(color: Colors.white),
            decoration: InputDecoration(
              filled: true,
              fillColor: AppColor.input.withAlpha(20),

              // Normal border
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12.r),
                borderSide: BorderSide.none,
              ),

              // Focused border (selected / active)
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12.r),
                borderSide: const BorderSide(
                  color: AppColor.main, // green border on focus
                  width: 2,
                ),
              ),

              // Optional: Error border
              errorBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12.r),
                borderSide: const BorderSide(
                  color: Colors.red,
                  width: 1.5,
                ),
              ),

              focusedErrorBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12.r),
                borderSide: const BorderSide(
                  color: Colors.red,
                  width: 2,
                ),
              ),

              prefixIcon: prefixIcon,
              suffixIcon: icon == null
                  ? null
                  : IconButton(
                icon: Icon(icon, color: Colors.white24),
                onPressed: onSuffixTap,
              ),

              hintText: hintText,
              hintStyle: AppTextStyles.size14w400(color: AppColor.label),
              contentPadding: contentPadding ??
                  const EdgeInsets.symmetric(vertical: 12, horizontal: 10),

              errorStyle: const TextStyle(
                color: Colors.red,
                fontSize: 12,
                height: 1.2,
              ),
              errorMaxLines: 2,
            ),
          ),
        )
      ],
    );
  }
}

