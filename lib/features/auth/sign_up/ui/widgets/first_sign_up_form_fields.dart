import 'package:flutter/material.dart';
import 'package:twazoon/core/theming/styles.dart';
import 'package:twazoon/core/helpers/spacing.dart';
import 'package:twazoon/core/widgets/app_text_form_field.dart';

class FirstSignUpFormFields extends StatelessWidget {
  const FirstSignUpFormFields({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text("الكلية:", style: TextStyles.font16BlackMedium),
        verticalSpace(10),
        AppTextFormField(hintText: "اسم الكلية"),
        verticalSpace(17),
        Text("الفرقة / المستوي:", style: TextStyles.font16BlackMedium),
        verticalSpace(10),
        AppTextFormField(hintText: "الفرقة"),
        verticalSpace(17),
        Text(
          "ما هو تقديرك او معدلك العام السابق ؟",
          style: TextStyles.font16BlackMedium,
        ),
        verticalSpace(10),
        AppTextFormField(hintText: "التقدير"),
        verticalSpace(17),
      ],
    );
  }
}
