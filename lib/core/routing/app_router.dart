import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:twazoon/core/di/dependency_injection.dart';
import 'package:twazoon/core/routing/routes.dart';
import 'package:twazoon/features/auth/login/logic/login_cubit.dart';
import 'package:twazoon/features/auth/login/ui/login_screen.dart';
import 'package:twazoon/features/home/home_screen.dart';
import 'package:twazoon/features/onboarding/onboarding_screen.dart';
import 'package:twazoon/features/auth/sign_up/ui/screens/sign_up_screen.dart';

class AppRouter {
  Route generateRoute(RouteSettings settings) {
    final arguments = settings.arguments;
    switch (settings.name) {
      case Routes.onBoardingScreen:
        return MaterialPageRoute(builder: (_) => const OnBoardingScreen());
      case Routes.loginScreen:
        return MaterialPageRoute(
          builder: (_) => BlocProvider(
            create: (context) => getIt<LoginCubit>(),
            child: const LoginScreen(),
          ),
        );
      case Routes.signUpScreen:
        return MaterialPageRoute(builder: (_) => const SignUpScreen());
      case Routes.homeScreen:
        return MaterialPageRoute(builder: (_) => const HomeScreen());
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
