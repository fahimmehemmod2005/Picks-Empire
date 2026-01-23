import 'package:fdahunter/app/routes/route_name.dart';
import 'package:fdahunter/core/constant/app_color.dart';
import 'package:fdahunter/core/constant/app_images.dart';
import 'package:fdahunter/core/constant/app_size_box.dart';
import 'package:flutter/material.dart';
import 'dart:async';

import 'package:flutter_screenutil/flutter_screenutil.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Timer(const Duration(seconds: 3), () {
      Navigator.pushReplacementNamed(context, RouteName.onboardingScreen);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [SizedBox(
          height: double.infinity.h,
          width: double.infinity.w,
          child: Image.asset(
            AppImages.backgound,
            fit: BoxFit.cover
            ),
        ),
        Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                height: 213.h,
                width: 204.w,
                child: Image.asset(AppImages.logo,fit: BoxFit.contain,)),
              AppSizeBox.height100,
              CircularProgressIndicator(
                color: AppColor.main,
              )
            ],
          ),
        ),

        ]
      ),
    );
  }
}
