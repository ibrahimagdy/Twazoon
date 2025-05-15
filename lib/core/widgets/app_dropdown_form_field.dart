import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:twazoon/core/theming/colors_manger.dart';

class AppDropdownFormField extends StatelessWidget {
  final String? selectedValue;
  final List<String> items;
  final String hintText;
  final ValueChanged<String?> onChanged;

  const AppDropdownFormField({
    super.key,
    required this.selectedValue,
    required this.items,
    required this.hintText,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return DropdownButtonFormField<String>(
      value: selectedValue,
      hint: Text(hintText),
      isExpanded: true,
      dropdownColor: ColorsManager.white,
      menuMaxHeight: MediaQuery.of(context).size.height / 3,
      decoration: InputDecoration(
        contentPadding: EdgeInsets.symmetric(vertical: 13.h, horizontal: 13.w),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: ColorsManager.mainLavenderLight, width: 1.5),
          borderRadius: BorderRadius.circular(8.r),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: ColorsManager.mainLavender, width: 1.5),
          borderRadius: BorderRadius.circular(8.r),
        ),
        errorBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.red, width: 1.5),
          borderRadius: BorderRadius.circular(8.r),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.red, width: 1.5),
          borderRadius: BorderRadius.circular(8.r),
        ),
        fillColor: ColorsManager.white,
        filled: true,
      ),
      items: items.map((String value) {
        return DropdownMenuItem<String>(
          value: value,
          child: Text(value),
        );
      }).toList(),
      onChanged: onChanged,
    );
  }
}
