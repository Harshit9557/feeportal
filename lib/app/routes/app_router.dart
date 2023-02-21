import 'package:feeportal/view/authentication/login/login_main_screen.dart';
import 'package:feeportal/view/authentication/signup/signup_main_screen.dart';
import 'package:feeportal/view/navbar/drawer/about_us.dart';
import 'package:feeportal/view/navbar/drawer/all_transaction_main_screen.dart';
import 'package:feeportal/view/navbar/drawer/contact_us.dart';
import 'package:feeportal/view/navbar/drawer/faqs.dart';
import 'package:feeportal/view/navbar/drawer/privacy_policy.dart';
import 'package:feeportal/view/navbar/drawer/terms.dart';
import 'package:feeportal/view/navbar/help_screen.dart';
import 'package:feeportal/view/navbar/navigation_screen/navigation_main_screen.dart';
import 'package:feeportal/view/splash_screen/no_internet_screen/no_internet_main_screen.dart';
import 'package:feeportal/view/splash_screen/splash_screen.dart';
import 'package:flutter/material.dart';

class AppRouter {
  static const noInternetMainRoute = '/NoInternetMainScreen';
  static const splashRoute = '/SplashScreen';
  static const navigationMainRoute = '/NavigationMainScreen';
  static const loginMainRoute = '/LoginMainScreen';
  static const allTransactionsMainRoute = '/AllTransactionsMainScreen';
  static const faqsMainRoute = '/FAQsMainScreen';
  static const contactUsMainRoute = '/ContactUsMainScreen';
  static const termsMainRoute = '/TermsAndConditionsMainScreen';
  static const aboutUsMainRoute = '/AboutUsMainScreen';
  static const helpMainRoute = '/HelpMainScreen';
  static const privacyPolicyMainRoute = '/PrivacyPolicyMainScreen';
  static const signUPMainRoute = '/SignUpMainScreen';

  static Route? generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case noInternetMainRoute:
        {
          return MaterialPageRoute(
            builder: (_) => const NoInternetMainScreen(),
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
      case loginMainRoute:
        {
          return MaterialPageRoute(
            builder: (_) => const LoginMainScreen(),
            settings: settings,
          );
        }
      case signUPMainRoute:
        {
          return MaterialPageRoute(
            builder: (_) => const SignUpMainScreen(),
            settings: settings,
          );
        }
      case allTransactionsMainRoute:
        {
          return MaterialPageRoute(
            builder: (_) => const AllTransactionsMainScreen(),
            settings: settings,
          );
        }
      case aboutUsMainRoute:
        {
          return MaterialPageRoute(
            builder: (_) => const AboutUsMainScreen(),
            settings: settings,
          );
        }
      case faqsMainRoute:
        {
          return MaterialPageRoute(
            builder: (_) => const FAQsMainScreen(),
            settings: settings,
          );
        }
      case contactUsMainRoute:
        {
          return MaterialPageRoute(
            builder: (_) => const ContactUsMainScreen(),
            settings: settings,
          );
        }
      case termsMainRoute:
        {
          return MaterialPageRoute(
            builder: (_) => const TermsAndConditionsMainScreen(),
            settings: settings,
          );
        }
      case helpMainRoute:
        {
          return MaterialPageRoute(
            builder: (_) => const HelpMainScreen(),
            settings: settings,
          );
        }
      case privacyPolicyMainRoute:
        {
          return MaterialPageRoute(
            builder: (_) => const PrivacyPolicyMainScreen(),
            settings: settings,
          );
        }
      default:
        {
          return MaterialPageRoute(
            builder: (_) => const NavigationMainScreen(),
            settings: settings,
          );
        }
    }
  }
}
