import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:twazoon/core/helpers/app_validation.dart';
import 'package:twazoon/core/theming/colors_manger.dart';
import 'package:twazoon/core/theming/styles.dart';
import 'package:twazoon/core/helpers/spacing.dart';
import 'package:twazoon/core/widgets/app_text_form_field.dart';
import 'package:twazoon/features/auth/sign_up/logic/sign_up_cubit.dart';

class SecondSignUpScreen extends StatefulWidget {
  const SecondSignUpScreen({super.key});

  @override
  State<SecondSignUpScreen> createState() => _SecondSignUpScreenState();
}

class _SecondSignUpScreenState extends State<SecondSignUpScreen> {
  bool isPasswordObscureText = true;
  bool isPasswordConfirmationObscureText = true;
  late SignUpCubit cubit;

  @override
  void initState() {
    super.initState();
    cubit = context.read<SignUpCubit>();
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: cubit.secondFormKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text("الإسم:", style: TextStyles.font16BlackMedium),
          verticalSpace(10),
          AppTextFormField(
            hintText: "اسم الطالب",
            controller: cubit.userNameController,
            validator: validateName,
          ),
          verticalSpace(17),
          Text("البريد الإلكتروني", style: TextStyles.font16BlackMedium),
          verticalSpace(10),
          AppTextFormField(
            hintText: "البريد الإلكتروني الخاص بالكلية",
            controller: cubit.emailController,
            validator: validateEmail,
          ),
          verticalSpace(17),
          Text("كلمة المرور:", style: TextStyles.font16BlackMedium),
          verticalSpace(10),
          AppTextFormField(
            hintText: "كلمة المرور",
            controller: cubit.passwordController,
            validator: validatePassword,
            isObscureText: isPasswordObscureText,
            suffixIcon: GestureDetector(
              onTap: () {
                setState(() {
                  isPasswordObscureText = !isPasswordObscureText;
                });
              },
              child: Icon(
                isPasswordObscureText
                    ? Icons.visibility_off
                    : Icons.visibility,
                color: isPasswordObscureText
                    ? ColorsManager.mainLavender
                    : ColorsManager.black,
              ),
            ),
          ),
          verticalSpace(17),
          Text("تأكيد كلمة المرور:", style: TextStyles.font16BlackMedium),
          verticalSpace(10),
          AppTextFormField(
            hintText: "كلمة المرور",
            controller: cubit.confirmPasswordController,
            isObscureText: isPasswordConfirmationObscureText,
            validator: (value) => validateConfirmPassword(
              value,
              cubit.passwordController.text,
            ),
            suffixIcon: GestureDetector(
              onTap: () {
                setState(() {
                  isPasswordConfirmationObscureText =
                  !isPasswordConfirmationObscureText;
                });
              },
              child: Icon(
                isPasswordConfirmationObscureText
                    ? Icons.visibility_off
                    : Icons.visibility,
                color: isPasswordConfirmationObscureText
                    ? ColorsManager.mainLavender
                    : ColorsManager.black,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
