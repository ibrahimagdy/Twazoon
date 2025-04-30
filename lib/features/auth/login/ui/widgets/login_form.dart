import 'package:flutter/material.dart';
import 'package:twazoon/core/routing/routes.dart';
import 'package:twazoon/core/theming/styles.dart';
import 'package:twazoon/core/helpers/spacing.dart';
import 'package:twazoon/core/helpers/extensions.dart';
import 'package:twazoon/core/widgets/app_text_button.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:twazoon/core/widgets/app_text_form_field.dart';

class LoginForm extends StatelessWidget {
  const LoginForm({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20.w),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text("تسجيل الدخول", style: TextStyles.font20BlackMedium),
          verticalSpace(20),
          AppTextFormField(
            hintText: "البريد الالكتروني الخاص بالكلية",
            keyboardType: TextInputType.emailAddress,
          ),
          verticalSpace(15),
          AppTextFormField(
            hintText: "كلمة المرور",
            isObscureText: true,
            suffixIcon: Icon(
              Icons.visibility_off,
              size: 20.sp,
              color: Colors.grey,
            ),
          ),
          verticalSpace(10),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              GestureDetector(
                onTap: () {},
                child: Text(
                  "نسيت كلمة المرور؟",
                  style: TextStyles.font14LavenderMedium,
                ),
              ),
            ],
          ),
          verticalSpace(30),
          AppTextButton(
            textButton: "تسجيل الدخول",
            onPressed: () {
            },
            borderRadius: 10.r,
          ),
          verticalSpace(20),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text("لا تمتلك حساب؟ ", style: TextStyles.font14BlackMedium),
              GestureDetector(
                onTap: () {
                  context.pushNamed(Routes.firstSignUpScreen);
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
