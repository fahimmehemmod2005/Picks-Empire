import 'package:fdahunter/app/routes/route_name.dart';
import 'package:fdahunter/app/widgets/main_button.dart';
import 'package:fdahunter/app/widgets/my_scaffold.dart';
import 'package:fdahunter/core/constant/app_color.dart';
import 'package:fdahunter/core/constant/app_images.dart';
import 'package:fdahunter/core/constant/app_size_box.dart';
import 'package:fdahunter/core/constant/app_text_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SuccessPaymentScreen extends StatefulWidget {
  const SuccessPaymentScreen({super.key});

  @override
  State<SuccessPaymentScreen> createState() => _SuccessPaymentScreenState();
}

class _SuccessPaymentScreenState extends State<SuccessPaymentScreen> {
  @override
  Widget build(BuildContext context) {
    return MyScaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: Column(
            children: [
              AppSizeBox.height100,
              Center(
                child: Image.asset(
                  AppImages.success,
                  height: 240.0.h,
                  width: 240.0.w,
                ),
              ),
              Text('Your subscription is success',style: AppTextStyles.size24w700(color: Colors.white),),
              Text(
                  'Thank you for your subscription to Kickster, enjoy various premium features of the world of football in your pocket',
              textAlign: TextAlign.center,
                style: AppTextStyles.size16w400(color: AppColor.label),
              ),
              SizedBox(height: 250.0.h),
              MainButton(
                label: 'Back to Home',
                onTap: (){
                  Navigator.pushReplacementNamed(context, RouteName.mainScreen);
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text('Payment success.', style: TextStyle(fontSize: 16, color: Colors.black,),),
                      backgroundColor: AppColor.main,
                      duration: const Duration(seconds: 2),
                      behavior: SnackBarBehavior.floating,
                      margin: const EdgeInsets.all(16),
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12),
                      ),
                      padding: const EdgeInsets.symmetric(
                        horizontal: 20,
                        vertical: 16,
                      ),
                    ),
                  );
                },
              ),
              AppSizeBox.height10,
            ],
          ),
        ),
      ),
    );
  }
}
