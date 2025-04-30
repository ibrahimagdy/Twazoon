import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:twazoon/core/routing/app_router.dart';
import 'package:twazoon/core/theming/colors_manger.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

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
      designSize: const Size(375, 812),
      minTextAdapt: true,
      child: MaterialApp(
        title: 'Twazoon',
        theme: ThemeData(
          scaffoldBackgroundColor: ColorsManager.white,
          primaryColor: ColorsManager.mainLavender,
          appBarTheme: const AppBarTheme(
            centerTitle: true,
            backgroundColor: ColorsManager.white,
            iconTheme: IconThemeData(
              color: ColorsManager.mainLavender,
            ),
            scrolledUnderElevation: 0,
          ),
        ),
        locale: const Locale('ar'),
        localizationsDelegates: const [
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
          GlobalCupertinoLocalizations.delegate,
        ],
        supportedLocales: const [
          Locale('ar'),
        ],
        builder: (context, child) {
          return Directionality(
            textDirection: TextDirection.rtl,
            child: child!,
          );
        },
        debugShowCheckedModeBanner: false,
        initialRoute: initialRoute,
        onGenerateRoute: appRoutes.generateRoute,
      ),
    );
  }
}