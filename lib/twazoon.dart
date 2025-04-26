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
        //navigatorKey: navigatorKey,
        title: 'Twazoon',
        theme: ThemeData(
          primaryColor: ColorsManager.mainLavender,
          //scaffoldBackgroundColor: ColorsManager.scaffoldBackground,
          appBarTheme: const AppBarTheme(
            centerTitle: true,
            iconTheme: IconThemeData(
              color: ColorsManager.mainLavender,
            ),
            scrolledUnderElevation: 0,
            //backgroundColor: ColorsManager.scaffoldBackground,
          ),
        ),
        debugShowCheckedModeBanner: false,
        //initialRoute: initialRoute,
        onGenerateRoute: appRoutes.generateRoute,
      ),
    );
  }
}
