import 'package:twazoon/core/di/dependency_injection.dart';
import 'package:twazoon/core/helpers/shared_pref_helper.dart';
import 'package:twazoon/twazoon.dart';
import 'package:flutter/material.dart';
import 'package:twazoon/core/routing/routes.dart';
import 'package:twazoon/core/routing/app_router.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  setupGetIt();

  runApp(Twazoon(appRoutes: AppRouter(), initialRoute: Routes.onBoardingScreen));
}

Future<bool> checkIfLoggedInUser() async {
  String? userToken = await SharedPrefHelper.getSecuredString(
    SharedPrefKeys.userToken,
  );
  return userToken != null && userToken.isNotEmpty;
}
