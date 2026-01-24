import 'package:fdahunter/features/auth/presentation/view/screens/category_screen.dart';
import 'package:fdahunter/features/auth/presentation/view/screens/create_account_screen.dart';
import 'package:fdahunter/features/auth/presentation/view/screens/forgot_screen.dart';
import 'package:fdahunter/features/auth/presentation/view/screens/login_screen.dart';
import 'package:fdahunter/features/auth/presentation/view/screens/otp_screen.dart';
import 'package:fdahunter/features/auth/presentation/view/screens/reset_password_screen.dart';
import 'package:fdahunter/features/home/view/screen/home_screen.dart';
import 'package:fdahunter/features/home/view/screen/sports_picks_screen.dart';
import 'package:fdahunter/features/main_screen/view/main_screen.dart';
import 'package:fdahunter/features/notification/view/screen/notification_screen.dart';
import 'package:fdahunter/features/onboarding/view/onboarding_screen.dart';
import 'package:fdahunter/features/profile/presentation/view/screens/profile_screen.dart';
import 'package:fdahunter/features/subscription/view/screen/payment_method_screen.dart';
import 'package:fdahunter/features/subscription/view/screen/subscription_screen.dart';
import 'package:fdahunter/features/subscription/view/screen/success_payment_screen.dart';
import 'package:flutter/material.dart';
import '../../features/splash/splash_screen.dart';
import 'route_name.dart';

class AppRoutes {

  // initialRoute
  static const String initialRoute = RouteName.splashScreen;

  static final Map<String, WidgetBuilder> routes = {

    // splash screens
    RouteName.splashScreen: (context) => const SplashScreen(),

    // auth screen
    RouteName.loginScreen: (context) => const LoginScreen(),
    RouteName.createAccountScreen: (context) => const CreateAccountScreen(),
    RouteName.categoryScreen: (context) => const CategoryScreen(),
    RouteName.onboardingScreen: (context) => const OnboardingScreen(),
    RouteName.forgotScreen: (context) => const ForgotScreen(),
    RouteName.otpScreen: (context) => const OtpScreen(),
    RouteName.resetPasswordScreen: (context) => const ResetPasswordScreen(),
    RouteName.mainScreen: (context) => const MainScreen(),
    RouteName.homeScreen: (context) => const HomeScreen(),
    RouteName.sportsPickScreen: (context) => const SportsPicksScreen(),
    RouteName.notificationScreen: (context) => const NotificationScreen(),
    RouteName.subscriptionScreen: (context) => const SubscriptionScreen(),
    RouteName.paymentMethodScreen: (context) => const PaymentMethodScreen(),
    RouteName.successPaymentScreen: (context) => const SuccessPaymentScreen(),
    RouteName.profileScreen: (context) => const ProfileScreen(),

  };
}