import 'package:flutter/material.dart';
import 'package:twazoon/core/theming/styles.dart';
import 'package:twazoon/core/helpers/spacing.dart';
import 'package:twazoon/core/theming/colors_manger.dart';
import 'package:twazoon/core/widgets/app_text_button.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class FirstSignUpFormQuestions extends StatefulWidget {
  const FirstSignUpFormQuestions({super.key});

  @override
  State<FirstSignUpFormQuestions> createState() =>
      _FirstSignUpFormQuestionsState();
}

class _FirstSignUpFormQuestionsState extends State<FirstSignUpFormQuestions> {
  String? _hasSleepProblems = 'نعم';
  String? _gender = 'ذكر';

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("الجنس:", style: TextStyles.font16BlackMedium),
              verticalSpace(10),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  _buildCustomRadioOption(
                    label: "ذكر",
                    value: "ذكر",
                    groupValue: _gender,
                    onTap: (value) {
                      setState(() {
                        _gender = value;
                      });
                    },
                  ),
                  horizontalSpace(20),
                  _buildCustomRadioOption(
                    label: "أنثى",
                    value: "أنثى",
                    groupValue: _gender,
                    onTap: (value) {
                      setState(() {
                        _gender = value;
                      });
                    },
                  ),
                ],
              ),
            ],
          ),
        ),
        verticalSpace(20),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "هل تعاني من مشاكل في النوم ؟",
                style: TextStyles.font16BlackMedium,
              ),
              verticalSpace(10),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  _buildCustomRadioOption(
                    label: "نعم",
                    value: "نعم",
                    groupValue: _hasSleepProblems,
                    onTap: (value) {
                      setState(() {
                        _hasSleepProblems = value;
                      });
                    },
                  ),
                  horizontalSpace(20),
                  _buildCustomRadioOption(
                    label: "لا",
                    value: "لا",
                    groupValue: _hasSleepProblems,
                    onTap: (value) {
                      setState(() {
                        _hasSleepProblems = value;
                      });
                    },
                  ),
                ],
              ),
            ],
          ),
        ),
        verticalSpace(50),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.w),
          child: AppTextButton(
            textButton: "التالي",
            onPressed: () {},
            borderRadius: 10.r,
          ),
        ),
        verticalSpace(20),
      ],
    );
  }

  Widget _buildCustomRadioOption({
    required String label,
    required String value,
    required String? groupValue,
    required Function(String) onTap,
  }) {
    bool isSelected = value == groupValue;
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
                color: isSelected ? ColorsManager.mainLavender : Colors.grey,
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
