import 'package:flutter/material.dart';
import 'package:twazoon/core/theming/colors_manger.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomIndicator extends StatelessWidget {
  final int currentPage;
  final int totalPages;
  final double? width;

  const CustomIndicator({
    super.key,
    required this.currentPage,
    required this.totalPages,
    this.width,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: List.generate(
        totalPages,
        (index) => AnimatedContainer(
          duration: const Duration(milliseconds: 300),
          margin: const EdgeInsets.symmetric(horizontal: 4),
          height: 3.h,
          width: (width ?? 40).w,
          decoration: BoxDecoration(
            color: _getIndicatorColor(index),
            borderRadius: BorderRadius.circular(20.r),
          ),
        ),
      ),
    );
  }

  Color _getIndicatorColor(int index) {
    if (totalPages == 2 && currentPage == 1) {
      return ColorsManager.mainLavender;
    }
    return index <= currentPage
        ? ColorsManager.mainLavenderLight
        : ColorsManager.mainLavender;
  }
}
