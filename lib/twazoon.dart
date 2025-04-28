import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:twazoon/core/routing/app_router.dart';
import 'package:twazoon/core/theming/colors_manger.dart';

class Twazoon extends StatelessWidget {
  final AppRouter appRoutes;
  final String initialRoute;

  const Twazoon({
    super.key,
    required this.appRoutes,
    required this.initialRoute,
  });

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(393, 852),
      minTextAdapt: true,
      child: MaterialApp(
        title: 'Twazoon',
        theme: ThemeData(
          scaffoldBackgroundColor: ColorsManager.white,
          primaryColor: ColorsManager.mainLavender,
          appBarTheme: const AppBarTheme(
            centerTitle: true,
            iconTheme: IconThemeData(
              color: ColorsManager.mainLavender,
            ),
            scrolledUnderElevation: 0,
          ),
        ),
        debugShowCheckedModeBanner: false,
        initialRoute: initialRoute,
        onGenerateRoute: appRoutes.generateRoute,
      ),
    );
  }
}
