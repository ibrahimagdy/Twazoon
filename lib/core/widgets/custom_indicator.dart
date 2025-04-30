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
          margin: EdgeInsets.symmetric(horizontal: 4.w),
          height: 4.h,
          width: (width ?? 42.w).w,
          decoration: BoxDecoration(
            color: index <= currentPage
                ? ColorsManager.mainLavender
                : ColorsManager.mainLavenderLight,
            borderRadius: BorderRadius.circular(22.r),
          ),
        ),
      ),
    );
  }

}
