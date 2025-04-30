import 'package:flutter/material.dart';
import 'package:twazoon/core/helpers/spacing.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class LoginHeader extends StatelessWidget {
  const LoginHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        verticalSpace(33),
        Image.asset(
          "assets/images/logo_lavender.png",
          width: 70.w,
          height: 86.h,
        ),
        Image.asset(
          "assets/images/twazoon_word.png",
          width: 80.w,
          height: 50.h,
        ),
        verticalSpace(88),
      ],
    );
  }
}
