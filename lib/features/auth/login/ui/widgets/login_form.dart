import 'package:flutter/material.dart';
import 'package:twazoon/core/helpers/app_validation.dart';
import 'package:twazoon/core/helpers/extensions.dart';
import 'package:twazoon/core/helpers/spacing.dart';
import 'package:twazoon/core/routing/routes.dart';
import 'package:twazoon/core/theming/colors_manger.dart';
import 'package:twazoon/core/theming/styles.dart';
import 'package:twazoon/core/widgets/app_text_form_field.dart';

class LoginForm extends StatefulWidget {
  final GlobalKey<FormState> formKey;
  final TextEditingController emailController;
  final TextEditingController passwordController;

  const LoginForm({
    super.key,
    required this.formKey,
    required this.emailController,
    required this.passwordController,
  });

  @override
  State<LoginForm> createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  bool isObscureText = true;
  @override
  Widget build(BuildContext context) {
    return Form(
      key: widget.formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text("تسجيل الدخول", style: TextStyles.font20BlackMedium),
          verticalSpace(18),
          AppTextFormField(
            hintText: "البريد الالكتروني الخاص بالكلية",
            controller: widget.emailController,
            validator: validateEmail,
          ),
          verticalSpace(16),
          AppTextFormField(
            hintText: "كلمة المرور",
            isObscureText: isObscureText,
            controller: widget.passwordController,
            validator: validatePassword,
            suffixIcon: GestureDetector(
              onTap: () {
                setState(() {
                  isObscureText = !isObscureText;
                });
              },
              child: Icon(
                isObscureText ? Icons.visibility_off : Icons.visibility,
                color: isObscureText
                    ? ColorsManager.mainLavender
                    : ColorsManager.black,
              ),
            ),
          ),
          verticalSpace(16),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              GestureDetector(
                onTap: () {
                  context.pushNamed(Routes.forgetPasswordScreen);
                },
                child: Text(
                  "نسيت كلمة المرور؟",
                  style: TextStyles.font14LavenderMedium,
                ),
              ),
            ],
          ),
          verticalSpace(33),
        ],
      ),
    );
  }
}
