import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:twazoon/core/theming/styles.dart';
import 'package:twazoon/core/theming/colors_manger.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AppTextFormField extends StatelessWidget {
  final double? width;
  final double? height;
  final EdgeInsetsGeometry? contentPadding;
  final InputBorder? focusedBorder;
  final InputBorder? enabledBorder;
  final TextStyle? inputTextStyle;
  final TextStyle? hintStyle;
  final String? hintText;
  final bool? isObscureText;
  final Widget? suffixIcon;
  final Widget? prefixIcon;
  final Color? backgroundColor;
  final TextInputType? keyboardType;
  final TextInputAction? textInputAction;
  final FormFieldValidator<String>? validator;
  final TextEditingController? controller;
  final FocusNode? focusNode;
  final bool? autoFocus;
  final bool? enabled;
  final bool? autoCorrect;
  final bool? enableSuggestions;
  final String? initialValue;
  final void Function(String)? onChanged;
  final void Function(String)? onFieldSubmitted;
  final void Function(String?)? onSaved;
  final Iterable<String>? autofillHints;
  final int? maxLines;
  final int? minLines;
  final double? borderRadius;
  final InputDecoration? decoration;
  final Color? borderColor;
  final List<TextInputFormatter>? inputFormatters;
  final InputBorder? border;

  const AppTextFormField({
    super.key,
    this.width,
    this.height,
    this.contentPadding,
    this.focusedBorder,
    this.enabledBorder,
    this.inputTextStyle,
    this.hintStyle,
    this.hintText,
    this.isObscureText,
    this.suffixIcon,
    this.prefixIcon,
    this.backgroundColor,
    this.keyboardType,
    this.textInputAction,
    this.validator,
    this.controller,
    this.focusNode,
    this.autoFocus,
    this.enabled,
    this.autoCorrect,
    this.enableSuggestions,
    this.initialValue,
    this.onChanged,
    this.onFieldSubmitted,
    this.onSaved,
    this.autofillHints,
    this.maxLines,
    this.minLines,
    this.borderRadius,
    this.decoration,
    this.borderColor,
    this.inputFormatters,
    this.border,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width ?? double.infinity,
      height: height,
      child: TextFormField(
        cursorColor: ColorsManager.mainLavender,
        controller: controller,
        focusNode: focusNode,
        keyboardType: keyboardType,
        textInputAction: textInputAction,
        validator: validator,
        autofocus: autoFocus ?? false,
        enabled: enabled ?? true,
        obscureText: isObscureText ?? false,
        autovalidateMode: AutovalidateMode.onUserInteraction,
        autocorrect: autoCorrect ?? true,
        enableSuggestions: enableSuggestions ?? true,
        initialValue: initialValue,
        onChanged: onChanged,
        onFieldSubmitted: onFieldSubmitted,
        onSaved: onSaved,
        maxLines: maxLines ?? 1,
        minLines: minLines ?? 1,
        style: inputTextStyle ?? TextStyles.font14GeryMedium,
        autofillHints: autofillHints,
        inputFormatters: inputFormatters,
        decoration:
            decoration ??
            InputDecoration(
              isDense: true,
              border: border,
              contentPadding:
                  contentPadding ??
                  EdgeInsets.symmetric(vertical: 13.h, horizontal: 13.w),
              enabledBorder:
                  enabledBorder ??
                  buildOutlineInputBorder(color: ColorsManager.mainLavender),
              focusedBorder:
                  focusedBorder ??
                  buildOutlineInputBorder(color: ColorsManager.mainLavender),
              focusedErrorBorder: buildOutlineInputBorder(color: Colors.red),
              errorBorder: buildOutlineInputBorder(color: Colors.red),
              hintStyle: hintStyle ?? TextStyles.font14GeryMedium,
              hintText: hintText,
              suffixIcon: suffixIcon,
              prefixIcon:
                  prefixIcon != null
                      ? Padding(
                        padding: EdgeInsets.symmetric(horizontal: 15.w),
                        child: prefixIcon,
                      )
                      : null,
              fillColor: ColorsManager.white,
              filled: true,
            ),
      ),
    );
  }

  OutlineInputBorder buildOutlineInputBorder({required Color color}) {
    return OutlineInputBorder(
      borderSide: BorderSide(color: color, width: 1.3),
      borderRadius: BorderRadius.circular(borderRadius ?? 5.r),
    );
  }
}
