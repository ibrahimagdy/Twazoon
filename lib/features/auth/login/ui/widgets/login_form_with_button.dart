import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:twazoon/core/routing/routes.dart';
import 'package:twazoon/core/theming/styles.dart';
import 'package:twazoon/core/helpers/spacing.dart';
import 'package:twazoon/core/helpers/extensions.dart';
import 'package:twazoon/core/widgets/app_text_button.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:twazoon/features/auth/login/logic/login_cubit.dart';
import 'package:twazoon/features/auth/login/ui/widgets/login_form.dart';

class LoginFormWithButton extends StatefulWidget {
  const LoginFormWithButton({super.key});

  @override
  State<LoginFormWithButton> createState() => _LoginFormWithButtonState();
}

class _LoginFormWithButtonState extends State<LoginFormWithButton> {
  late LoginCubit cubit;

  @override
  void initState() {
    cubit = BlocProvider.of<LoginCubit>(context);
    super.initState();
  }

  void _submitForm() {
    if (cubit.formKey.currentState!.validate()) {
      final email = cubit.emailController.text.trim();
      final password = cubit.passwordController.text.trim();
      context.read<LoginCubit>().emitLoginStates(email, password);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20.w),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          LoginForm(
            formKey: cubit.formKey,
            emailController: cubit.emailController,
            passwordController: cubit.passwordController,
          ),
          AppTextButton(
            textButton: "تسجيل الدخول",
            onPressed: _submitForm,
            borderRadius: 8.r,
          ),
          verticalSpace(26),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text("لا تمتلك حساب؟ ", style: TextStyles.font14BlackMedium),
              GestureDetector(
                onTap: () {
                  context.pushNamed(Routes.signUpScreen);
                },
                child: Text(
                  "قم بأنشاء حساب",
                  style: TextStyles.font14DarkLavenderBold,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
