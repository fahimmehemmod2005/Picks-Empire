import 'package:fdahunter/features/auth/presentation/viewmodel/resend_button_view_model.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../../../core/constant/app_color.dart';
import '../../../../../core/constant/app_text_styles.dart';

class ResendButton extends StatelessWidget {
  const ResendButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<ResendButtonViewModel>(
      builder: (context, resend, child) {
        return Center(
          child: Text.rich(
            TextSpan(
              text: "Didn’t receive the code? ",
              style: AppTextStyles.size16w700(color: AppColor.label),
              children: [
                resend.isResendAvailable
                    ? TextSpan(
                  text: "Resend Code",
                  style: AppTextStyles.size16w700(color: AppColor.main),
                  recognizer: TapGestureRecognizer()
                    ..onTap = resend.onResend,
                )
                    : TextSpan(
                  text: " ${resend.formatTime()}",
                  style: AppTextStyles.size16w700(color: AppColor.main),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}