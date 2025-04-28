import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:twazoon/core/helpers/spacing.dart';
import 'package:twazoon/core/theming/styles.dart';
import 'package:twazoon/features/onboarding/model/on_boarding_model.dart';

class OnBoardingContent extends StatelessWidget {
  final OnBoardingModel model;

  const OnBoardingContent(this.model, {super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20.w),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(
            model.imagePath,
            fit: BoxFit.contain,
          ),
          verticalSpace(30),
          Text(
            model.title,
            textAlign: TextAlign.center,
            style: TextStyles.font16BlackMedium
          ),
        ],
      ),
    );
  }
}
