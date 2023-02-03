import 'package:feeportal/view/authentication/login/login_screen.dart';
import 'package:feeportal/view/navbar/navigation_screen.dart';
import 'package:feeportal/view/splash_screen/no_internet_screen.dart';
import 'package:feeportal/view/splash_screen/splash_screen.dart';
import 'package:flutter/material.dart';

class AppRouter {
  static const noInternetRoute = '/NoInternetScreen';
  static const splashRoute = '/SplashScreen';
  static const navigationRoute = '/NavigationScreen';
  static const loginRoute = '/LoginScreen';

  static Route? generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case noInternetRoute:
        {
          return MaterialPageRoute(
            builder: (_) => const NoInternetScreen(),
            settings: settings,
          );
        }
      case splashRoute:
        {
          return MaterialPageRoute(
            builder: (_) => const SplashScreen(),
            settings: settings,
          );
        }
      case loginRoute:
        {
          return MaterialPageRoute(
            builder: (_) => const LoginScreen(),
            settings: settings,
          );
        }
      default:
        {
          return MaterialPageRoute(
            builder: (_) => const NavigationScreen(),
            settings: settings,
          );
        }
    }
  }
}
