import 'package:flutter/material.dart';

import '../../../../core/constant/app_color.dart';
import '../../../../core/constant/app_text_styles.dart';

class PromoCodeField extends StatelessWidget {
  final void Function()? applyTap;
  final TextEditingController? controller;
  const PromoCodeField({
    super.key, this.applyTap, this.controller,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      cursorColor: Colors.white,
      style: TextStyle(color: Colors.white),
      controller: controller,
      decoration: InputDecoration(
        filled: true,
        hintText: 'Promo Code',
        hintStyle: AppTextStyles.size14w400(color: AppColor.label),
        fillColor: AppColor.label.withAlpha(10),
        suffixIcon: ElevatedButton(
            style: ElevatedButton.styleFrom(
                backgroundColor: AppColor.main,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                )
            ),
            onPressed: applyTap,
            child: Text('Apply',style: TextStyle(color: Colors.black),)
        ),
        focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10.0),
            borderSide: BorderSide(color: Colors.transparent)
        ),
        disabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10.0),
            borderSide: BorderSide(color: Colors.transparent)
        ),
        enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10.0),
            borderSide: BorderSide(color: Colors.transparent)
        ),
      ),
    );
  }
}