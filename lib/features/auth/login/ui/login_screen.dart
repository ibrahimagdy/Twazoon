import 'package:flutter_svg/svg.dart';
import 'package:flutter/material.dart';
import 'package:twazoon/core/helpers/spacing.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Stack(
            alignment: Alignment.topCenter,
            children: [
              SizedBox(
                width: double.infinity,
                height: 300.h,
                child: SvgPicture.asset(
                  'assets/svgs/login_curve_cropped.svg',
                  fit: BoxFit.fill,
                ),
              ),

              Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  verticalSpace(
                    50,
                  ), // Adjust spacing to position logo correctly
                  Image.asset(
                    "assets/images/logo_lavander.png",
                    width: 70.w,
                    height: 88.h,
                  ),
                  verticalSpace(20),
                  Image.asset(
                    "assets/images/twazoon_word.png",
                    width: 70.w,
                    height: 88.h,
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
