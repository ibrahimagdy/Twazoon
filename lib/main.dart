import 'package:twazoon/core/di/dependency_injection.dart';
import 'package:twazoon/core/helpers/shared_pref_helper.dart';
import 'package:twazoon/twazoon.dart';
import 'package:flutter/material.dart';
import 'package:twazoon/core/routing/routes.dart';
import 'package:twazoon/core/routing/app_router.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  setupGetIt();

  final bool isFirstLaunch = await SharedPrefHelper.isFirstLaunch();
  String initialRoute;

  if (isFirstLaunch) {
    initialRoute = Routes.onBoardingScreen;
  } else {
    final authStatus = await checkUserAuthStatus();

    if (authStatus['isLoggedIn']) {
      if (authStatus['isVerified']) {
        initialRoute = Routes.appLayout;
      } else {
        initialRoute = Routes.verifySignUpScreen;
      }
    } else if (authStatus['userEmail'] != null && authStatus['userEmail'].isNotEmpty) {
      initialRoute = Routes.verifySignUpScreen;
    } else {
      initialRoute = Routes.loginScreen;
    }
  }

  runApp(
    Twazoon(
      appRoutes: AppRouter(),
      initialRoute: initialRoute,
    ),
  );
}

Future<Map<String, dynamic>> checkUserAuthStatus() async {
  String? userToken = await SharedPrefHelper.getSecuredString(
    SharedPrefKeys.userToken,
  );
  String? userEmail = await SharedPrefHelper.getString(
    SharedPrefKeys.userEmail,
  );
  bool isLoggedIn = userToken != null && userToken.isNotEmpty;
  bool isVerified = await SharedPrefHelper.isOtpVerified();

  return {
    'isLoggedIn': isLoggedIn,
    'isVerified': isVerified,
    'userEmail': userEmail,
  };
}