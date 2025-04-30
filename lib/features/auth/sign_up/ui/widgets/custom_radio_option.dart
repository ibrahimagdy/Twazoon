import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:twazoon/core/helpers/spacing.dart';
import 'package:twazoon/core/theming/colors_manger.dart';
import 'package:twazoon/core/theming/styles.dart';

class CustomRadioOption extends StatelessWidget {
  final String label;
  final String value;
  final String? groupValue;
  final Function(String) onTap;

  const CustomRadioOption({
    super.key,
    required this.label,
    required this.value,
    this.groupValue,
    required this.onTap,
  });


  @override
  Widget build(BuildContext context) {
    final bool isSelected = value == groupValue;
    return GestureDetector(
      onTap: () => onTap(value),
      child: Row(
        children: [
          Container(
            width: 20.w,
            height: 20.h,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color:
              isSelected ? ColorsManager.mainLavender : Colors.transparent,
              border: Border.all(
                color: isSelected ? ColorsManager.mainLavender : ColorsManager.mainLavender,
                width: 2.w,
              ),
            ),
          ),
          horizontalSpace(10),
          Text(label, style: TextStyles.font14BlackMedium),
        ],
      ),
    );
  }
}
