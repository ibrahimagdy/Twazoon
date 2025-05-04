import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:twazoon/core/theming/colors_manger.dart';
import 'package:twazoon/core/theming/styles.dart';

class CollegeDropdown extends StatelessWidget {
  final String? selectedCollege;
  final List<String> colleges;
  final ValueChanged<String?> onChanged;

  const CollegeDropdown({
    super.key,
    required this.selectedCollege,
    required this.colleges,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text("الكلية:", style: TextStyles.font16BlackMedium),
        SizedBox(height: 10.h),
        DropdownButtonFormField<String>(
          value: selectedCollege,
          hint: Text("اختر الكلية"),
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
          items: colleges.map((String college) {
            return DropdownMenuItem<String>(
              value: college,
              child: Text(college),
            );
          }).toList(),
          onChanged: onChanged,
        ),
      ],
    );
  }
}
