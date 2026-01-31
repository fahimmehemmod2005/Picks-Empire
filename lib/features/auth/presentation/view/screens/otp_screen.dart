import 'package:fdahunter/app/routes/route_name.dart';
import 'package:fdahunter/app/widgets/main_button.dart';
import 'package:fdahunter/app/widgets/my_scaffold.dart';
import 'package:fdahunter/app/widgets/title_subtitle_bar.dart';
import 'package:fdahunter/app/widgets/widget_header.dart';
import 'package:fdahunter/core/constant/app_size_box.dart';
import 'package:fdahunter/features/auth/presentation/view/widgets/resend_button.dart';
import 'package:fdahunter/features/auth/presentation/viewmodel/otp_view_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pinput/pinput.dart';
import 'package:provider/provider.dart';

import '../../../../../core/constant/app_color.dart';
import '../../../../../core/constant/app_text_styles.dart';

class OtpScreen extends StatefulWidget {
  final String from;
  const OtpScreen({super.key,required this.from});

  @override
  State<OtpScreen> createState() => _OtpScreenState();
}

class _OtpScreenState extends State<OtpScreen> {
  final _pinController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  @override
  void dispose() {
    _pinController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final defaultPinTheme = PinTheme(
      height: 56,
      width: 56,
      textStyle: AppTextStyles.size16w600(color: AppColor.main),
      decoration: BoxDecoration(
        color: AppColor.input.withAlpha(20),
        borderRadius: BorderRadius.circular(16.r),
      ),
    );

    final focusedPinTheme = defaultPinTheme.copyWith(
      decoration: BoxDecoration(
        color: AppColor.input.withAlpha(20),
        borderRadius: BorderRadius.circular(16.r),
      ),
    );

    final errorPinTheme = defaultPinTheme.copyWith(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16.r),
        border: Border.all(color: Colors.red, width: 1),
      ),
    );
    return Consumer<OtpViewModel>(
      builder: (context, provider, child) {
        return MyScaffold(
          body: SafeArea(
            child: SingleChildScrollView(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: Form(
                key: _formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    AppSizeBox.height5,
                    WidgetHeader(),
                    AppSizeBox.height25,
                    TitleSubtitleBar(
                      title: "Enter OTP Code",
                      subtitle: "Please submit 4 digit code in you email",
                    ),
                    AppSizeBox.height5,
                    Text(
                      'example@gmail.com',
                      style: AppTextStyles.size14w400(color: AppColor.title),
                    ),
                    AppSizeBox.height30,
                    Pinput(
                      keyboardType: TextInputType.number,
                      validator: provider.otpValidator,
                      controller: _pinController,
                      length: 6,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      defaultPinTheme: defaultPinTheme,
                      focusedPinTheme: focusedPinTheme,
                      errorPinTheme: errorPinTheme,
                    ),
                    AppSizeBox.height25,
                    MainButton(
                      label: "Continue",
                      onTap: () {
                        if (_formKey.currentState!.validate()) {
                          if(widget.from == 'createAccountScreen'){
                            Navigator.pushNamed(context, RouteName.categoryScreen);
                          } else {
                            Navigator.pushNamed(context, RouteName.resetPasswordScreen);
                          }
                          print("OTP: ${_pinController.text.trim()}");
                        } else {
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              content: const Text(
                                'fill all field',
                                style: TextStyle(
                                  fontSize: 16,
                                  color: Colors.white,
                                ),
                              ),
                              backgroundColor: Colors.red.shade700,
                              duration: const Duration(seconds: 2),
                              behavior: SnackBarBehavior.floating,
                              margin: const EdgeInsets.all(16),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(12),
                              ),
                              padding: const EdgeInsets.symmetric(
                                horizontal: 20,
                                vertical: 16,
                              ),
                            ),
                          );
                          print('fill all field');
                        }
                      },
                    ),

                    AppSizeBox.height25,

                    ResendButton(),

                    AppSizeBox.height10
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
