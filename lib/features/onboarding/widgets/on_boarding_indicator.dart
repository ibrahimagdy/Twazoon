import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:twazoon/core/theming/colors_manger.dart';

class OnBoardingIndicator extends StatelessWidget {
  final PageController controller;
  final int length;

  const OnBoardingIndicator({
    required this.controller,
    required this.length,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SmoothPageIndicator(
      controller: controller,
      count: length,
      effect: ExpandingDotsEffect(
        activeDotColor: ColorsManager.mainLavender,
        dotHeight: 8.h,
        dotWidth: 8.w,
        expansionFactor: 3,
        spacing: 8.w,
        dotColor: ColorsManager.grey,
      ),
    );
  }
}
