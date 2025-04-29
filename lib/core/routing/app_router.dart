import 'package:flutter/material.dart';
import 'package:twazoon/core/routing/routes.dart';
import 'package:twazoon/features/auth/login/ui/login_screen.dart';
import 'package:twazoon/features/onboarding/onboarding_screen.dart';
import 'package:twazoon/features/auth/sign_up/ui/screens/first_sign_up_screen.dart';
import 'package:twazoon/features/auth/sign_up/ui/screens/second_sign_up_screen.dart';

class AppRouter {
  Route generateRoute(RouteSettings settings) {
    final arguments = settings.arguments;
    switch (settings.name) {
      case Routes.onBoardingScreen:
        return MaterialPageRoute(builder: (_) => const OnBoardingScreen());
      case Routes.loginScreen:
        return MaterialPageRoute(builder: (_) => const LoginScreen());
      case Routes.firstSignUpScreen:
        return MaterialPageRoute(builder: (_) => const FirstSignUpScreen());
      case Routes.secondSignUpScreen:
        return MaterialPageRoute(builder: (_) => const SecondSignUpScreen());

      default:
        return MaterialPageRoute(
          builder:
              (_) => Scaffold(
                body: Center(
                  child: Text('No route defined for ${settings.name}'),
                ),
              ),
        );
    }
  }
}
