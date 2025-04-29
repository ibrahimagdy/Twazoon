import 'package:flutter/material.dart';
import 'package:twazoon/core/theming/styles.dart';
import 'package:twazoon/core/helpers/spacing.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:twazoon/core/widgets/app_text_form_field.dart';

class FirstSignUpFormFields extends StatelessWidget {
  const FirstSignUpFormFields({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("الكلية:", style: TextStyles.font16BlackMedium),
              verticalSpace(10),
              AppTextFormField(hintText: "الكلية"),
            ],
          ),
        ),
        verticalSpace(20),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("الفرقة / المستوي:", style: TextStyles.font16BlackMedium),
              verticalSpace(10),
              AppTextFormField(hintText: "الفرقة / المستوي"),
            ],
          ),
        ),
        verticalSpace(30),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "ما هو تقديرك او معدلك العام السابق ؟",
                style: TextStyles.font16BlackMedium,
              ),
              verticalSpace(10),
              AppTextFormField(hintText: "التقدير / المعدل"),
            ],
          ),
        ),
        verticalSpace(40),
      ],
    );
  }
}
