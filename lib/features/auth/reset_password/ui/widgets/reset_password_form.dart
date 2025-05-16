import 'package:flutter/material.dart';
import 'package:twazoon/core/helpers/app_validation.dart';
import 'package:twazoon/core/helpers/spacing.dart';
import 'package:twazoon/core/widgets/app_text_button.dart';
import 'package:twazoon/core/widgets/app_text_form_field.dart';

class ResetPasswordForm extends StatelessWidget {
  const ResetPasswordForm({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        AppTextFormField(
          hintText: 'كلمة المرور الجديده',
          validator: validatePassword,
        ),
        verticalSpace(22),
        AppTextFormField(
          hintText: 'تأكيد كلمة المرور',
          //validator: validateConfirmPassword(value, password),
        ),
        verticalSpace(22),
        AppTextButton(onPressed: (){}, textButton: 'تحديث')
      ],
    );
  }
}
