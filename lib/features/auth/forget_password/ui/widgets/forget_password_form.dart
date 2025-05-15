import 'package:flutter/material.dart';
import 'package:twazoon/core/helpers/app_validation.dart';
import 'package:twazoon/core/helpers/spacing.dart';
import 'package:twazoon/core/widgets/app_text_button.dart';
import 'package:twazoon/core/widgets/app_text_form_field.dart';

class ForgetPasswordForm extends StatelessWidget {
  const ForgetPasswordForm({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        verticalSpace(32),
        AppTextFormField(
          hintText: 'البريد الالكتروني',
          validator: validateEmail,
        ),
        verticalSpace(22),
        AppTextButton(onPressed: () {}, textButton: 'التالي'),
      ],
    );
  }
}
