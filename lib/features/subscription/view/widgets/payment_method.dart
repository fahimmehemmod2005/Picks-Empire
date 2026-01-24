import 'package:fdahunter/core/constant/app_color.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import '../../../../core/constant/app_images.dart';
import '../../viewmodel/payment_method_view_model.dart';

class PaymentMethod extends StatelessWidget {
  const PaymentMethod({super.key});
  @override
  Widget build(BuildContext context) {
    var paymentMethod = [
      AppImages.visa,
      AppImages.master,
      AppImages.stripe
    ];
    return Consumer<PaymentMethodViewModel>(
      builder: (context, provider, child) {
        return Row(
          children: paymentMethod.map((image) {
            bool isSelected = provider.selectedMethod == image;
            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 5.0),
              child: ChoiceChip(
                showCheckmark: false,
                padding: EdgeInsets.zero,
                label: Container(
                  height: 40.h,
                  width: 60.w,
                  alignment: Alignment.center,
                  child: Image.asset(image, fit: BoxFit.contain),
                ),
                selected: isSelected,
                onSelected: (_) {
                  provider.selectMethod(image);
                },
                backgroundColor: const Color(0xFF1A2F1A),
                selectedColor: const Color(0xFF1A2F1A),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                  side: BorderSide(
                    color: isSelected ? AppColor.main : AppColor.label,
                    width: 1,
                  ),
                ),
              ),
            );
          }).toList(),
        );
      },
    );
  }
}