import 'package:fdahunter/features/auth/presentation/view/screens/login_screen.dart';
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

  };
}