import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:twazoon/core/helpers/app_validation.dart';
import 'package:twazoon/core/helpers/shared_pref_helper.dart';
import 'package:twazoon/core/helpers/spacing.dart';
import 'package:twazoon/core/widgets/app_text_button.dart';
import 'package:twazoon/core/widgets/app_text_form_field.dart';
import 'package:twazoon/features/auth/forget_password/logic/forget_password_cubit.dart';

class ForgetPasswordForm extends StatefulWidget {
  const ForgetPasswordForm({super.key});

  @override
  State<ForgetPasswordForm> createState() => _ForgetPasswordFormState();
}

class _ForgetPasswordFormState extends State<ForgetPasswordForm> {
  late ForgetPasswordCubit cubit;

  @override
  void initState() {
    cubit = BlocProvider.of<ForgetPasswordCubit>(context);
    super.initState();
  }

  void _submitForm() async {
    if (cubit.formKey.currentState!.validate()) {
      final String email = cubit.emailController.text;
      await SharedPrefHelper.setData('email', email);
      cubit.forgetPassword(email);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: cubit.formKey,
      child: Column(
        children: [
          verticalSpace(32),
          AppTextFormField(
            hintText: 'البريد الالكتروني',
            validator: validateEmail,
            controller: cubit.emailController,
          ),
          verticalSpace(22),
          AppTextButton(onPressed: _submitForm, textButton: 'التالي'),
        ],
      ),
    );
  }
}
