import 'package:flutter/material.dart';
import 'package:twazoon/core/theming/styles.dart';
import 'package:twazoon/core/theming/colors_manger.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:twazoon/core/theming/font_weight_helper.dart';

class AppTextButton extends StatelessWidget {
  final String textButton;
  final VoidCallback? onPressed;
  final Color? backgroundColor;
  final Color? borderColor;
  final Color? textColor;
  final Color? disabledBackgroundColor;
  final Color? disabledTextColor;
  final double? width;
  final double? height;
  final double? fontSize;
  final double? borderRadius;
  final FontWeight? fontWeight;
  final EdgeInsetsGeometry? padding;
  final EdgeInsetsGeometry? buttonPadding;
  final bool enabled;
  final bool isLoading;

  const AppTextButton({
    super.key,
    this.enabled = true,
    required this.onPressed,
    required this.textButton,
    this.backgroundColor,
    this.borderColor,
    this.textColor,
    this.disabledBackgroundColor,
    this.disabledTextColor,
    this.width,
    this.height,
    this.fontSize,
    this.borderRadius,
    this.fontWeight,
    this.padding,
    this.buttonPadding,
    this.isLoading = false,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width ?? double.infinity,
      height: height ?? 51.h,
      child: ElevatedButton(
        onPressed: enabled && !isLoading ? onPressed : null,
        style: ElevatedButton.styleFrom(
          backgroundColor: backgroundColor ?? ColorsManager.mainLavender,
          disabledBackgroundColor:
              disabledBackgroundColor ??
              ColorsManager.mainLavender.withValues(alpha: 0.8),
          disabledForegroundColor: disabledTextColor ?? ColorsManager.white,
          padding: padding ?? EdgeInsets.symmetric(vertical: 12.h),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(borderRadius ?? 20.r),
            side: BorderSide(
              width: 2.w,
              color:
                  (onPressed == null || isLoading)
                      ? Colors.transparent
                      : borderColor ?? ColorsManager.mainLavender,
            ),
          ),
        ),
        child:
            isLoading
                ? SizedBox(
                  width: 20.w,
                  height: 20.h,
                  child: CircularProgressIndicator(
                    strokeWidth: 2,
                    valueColor: AlwaysStoppedAnimation<Color>(
                      textColor ?? ColorsManager.white,
                    ),
                  ),
                )
                : Text(
                  textButton,
                  style: TextStyles.font18WhiteMedium.copyWith(
                    color:
                        onPressed == null
                            ? disabledTextColor ?? ColorsManager.white
                            : textColor ?? ColorsManager.white,
                    fontSize: fontSize ?? 16,
                    fontWeight: fontWeight ?? FontWeightHelper.semiBold,
                  ),
                ),
      ),
    );
  }
}
