import 'package:fdahunter/app/routes/route_name.dart';
import 'package:fdahunter/core/constant/app_images.dart';
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
      body: SizedBox(
        height: double.infinity.h,
        width: double.infinity.w,
        child: Image.asset(
            AppImages.background,
            fit: BoxFit.cover
        ),
      ),
    );
  }
}
