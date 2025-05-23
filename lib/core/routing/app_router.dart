import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:twazoon/core/di/dependency_injection.dart';
import 'package:twazoon/core/routing/routes.dart';
import 'package:twazoon/features/app_layout/app_layout.dart';
import 'package:twazoon/features/auth/forget_password/logic/forget_password_cubit.dart';
import 'package:twazoon/features/auth/forget_password/ui/forget_password_screen.dart';
import 'package:twazoon/features/auth/login/logic/login_cubit.dart';
import 'package:twazoon/features/auth/login/ui/login_screen.dart';
import 'package:twazoon/features/auth/otp/logic/verify_otp_cubit.dart';
import 'package:twazoon/features/auth/otp/ui/otp_screen.dart';
import 'package:twazoon/features/auth/reset_password/logic/reset_password_cubit.dart';
import 'package:twazoon/features/auth/reset_password/ui/reset_password_screen.dart';
import 'package:twazoon/features/auth/sign_up/logic/sign_up_cubit.dart';
import 'package:twazoon/features/auth/verify_sign_up/ui/verify_sign_up_screen.dart';
import 'package:twazoon/features/onboarding/onboarding_screen.dart';
import 'package:twazoon/features/auth/sign_up/ui/sign_up_screen.dart';

class AppRouter {
  Route generateRoute(RouteSettings settings) {
    final arguments = settings.arguments;
    switch (settings.name) {
      case Routes.onBoardingScreen:
        return MaterialPageRoute(builder: (_) => const OnBoardingScreen());
      case Routes.loginScreen:
        return MaterialPageRoute(
          builder:
              (_) => BlocProvider(
                create: (context) => getIt<LoginCubit>(),
                child: const LoginScreen(),
              ),
        );
      case Routes.signUpScreen:
        return MaterialPageRoute(
          builder:
              (_) => BlocProvider(
                create: (context) => getIt<SignUpCubit>(),
                child: SignUpScreen(),
              ),
        );
      case Routes.appLayout:
        return MaterialPageRoute(builder: (_) => const AppLayout());
      case Routes.forgetPasswordScreen:
        return MaterialPageRoute(
          builder:
              (_) => BlocProvider(
                create: (context) => getIt<ForgetPasswordCubit>(),
                child: ForgetPasswordScreen(),
              ),
        );
      case Routes.otpScreen:
        return MaterialPageRoute(
          builder:
              (_) => BlocProvider(
                create: (context) => getIt<VerifyOtpCubit>(),
                child: OtpScreen(),
              ),
        );
      case Routes.resetPasswordScreen:
        return MaterialPageRoute(
          builder:
              (_) => BlocProvider(
                create: (context) => getIt<ResetPasswordCubit>(),
                child: ResetPasswordScreen(),
              ),
        );
      case Routes.verifySignUpScreen:
        return MaterialPageRoute(
          builder:
              (_) => BlocProvider(
                create: (context) => getIt<VerifyOtpCubit>(),
                child: VerifySignUpScreen(),
              ),
        );
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
