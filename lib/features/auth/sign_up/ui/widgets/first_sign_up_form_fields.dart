import 'package:flutter/material.dart';
import 'package:twazoon/core/theming/styles.dart';
import 'package:twazoon/core/helpers/spacing.dart';
import 'package:twazoon/core/widgets/app_text_form_field.dart';
import 'package:twazoon/features/auth/sign_up/ui/widgets/college_dropdown.dart';

class FirstSignUpFormFields extends StatefulWidget {
  const FirstSignUpFormFields({super.key});

  @override
  State<FirstSignUpFormFields> createState() => _FirstSignUpFormFieldsState();
}

class _FirstSignUpFormFieldsState extends State<FirstSignUpFormFields> {
  String? selectedCollege;
  List<String> colleges = [
    "كلية الطب",
    "كلية طب الأسنان",
    "كلية الطب البيطري",
    "كلية الهندسة",
    "كلية الحاسبات والمعلومات",
    "كلية الصيدلة",
    "كلية العلوم",
    "كلية التمريض",
    "كلية التربية",
    "كلية الزراعة",
    "كلية التجارة",
    "كلية التربية النوعية",
    "كلية التربية للطفولة المبكرة",
    "كلية الفنون الجميلة",
    "كلية الآداب",
    "كلية الحقوق",
    "كلية السياحة والفنادق",
    "كلية التربية الرياضية",
    "المعهد الفني للتمريض"
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text("الكلية:", style: TextStyles.font16BlackMedium),
        verticalSpace(10),
        CollegeDropdown(
          selectedCollege: selectedCollege,
          colleges: colleges,
          onChanged: (String? newValue) {
            setState(() {
              selectedCollege = newValue;
            });
          },
        ),
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