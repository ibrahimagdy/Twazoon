import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:twazoon/core/helpers/app_validation.dart';
import 'package:twazoon/core/helpers/constants.dart';
import 'package:twazoon/core/theming/styles.dart';
import 'package:twazoon/core/helpers/spacing.dart';
import 'package:twazoon/core/widgets/app_dropdown_form_field.dart';
import 'package:twazoon/core/widgets/app_text_form_field.dart';
import 'package:twazoon/features/auth/sign_up/logic/sign_up_cubit.dart';

class FirstSignUpFormFields extends StatefulWidget {
  const FirstSignUpFormFields({super.key});

  @override
  State<FirstSignUpFormFields> createState() => _FirstSignUpFormFieldsState();
}

class _FirstSignUpFormFieldsState extends State<FirstSignUpFormFields> {
  String? selectedCollege;
  late SignUpCubit cubit;

  @override
  void initState() {
    super.initState();
    cubit = context.read<SignUpCubit>();
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: cubit.firstFormKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text("الكلية:", style: TextStyles.font16BlackMedium),
          verticalSpace(10),
          AppDropdownFormField(
            selectedValue: cubit.facultyController.text.isNotEmpty
                ? cubit.facultyController.text
                : null,
            items: colleges,
            hintText: "اختر الكلية",
            onChanged: (String? newValue) {
              cubit.facultyController.text = newValue ?? '';
            },
            validator: validateFaculty,
          ),
          verticalSpace(17),
          Text("الفرقة / المستوي:", style: TextStyles.font16BlackMedium),
          verticalSpace(10),
          AppDropdownFormField(
            selectedValue: cubit.levelController.text.isNotEmpty
                ? cubit.levelController.text
                : null,
            items: levels,
            hintText: "اختر الفرقة",
            onChanged: (String? newValue) {
              cubit.levelController.text = newValue ?? '';
            },
            validator: validateLevel,
          ),
          verticalSpace(17),
          Text(
            "ما هو تقديرك او معدلك العام السابق ؟",
            style: TextStyles.font16BlackMedium,
          ),
          verticalSpace(10),
          AppTextFormField(
            hintText: "التقدير",
            controller: cubit.lastGradeController,
            keyboardType: TextInputType.number,
            validator: validateGrade,
          ),
          verticalSpace(17),
        ],
      ),
    );
  }
}
