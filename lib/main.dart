import 'package:twazoon/core/routing/app_router.dart';
import 'package:twazoon/core/routing/routes.dart';
import 'package:twazoon/twazoon.dart';
import 'package:flutter/material.dart';
import 'core/helpers/shared_pref_helper.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  runApp(Twazoon(appRoutes: AppRouter(), initialRoute: Routes.onBoardingScreen));
}

Future<bool> checkIfLoggedInUser() async {
  String? userToken = await SharedPrefHelper.getSecuredString(
    SharedPrefKeys.userToken,
  );
  return userToken != null && userToken.isNotEmpty;
}
