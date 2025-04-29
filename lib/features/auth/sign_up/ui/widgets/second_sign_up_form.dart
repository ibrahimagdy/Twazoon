import 'package:flutter/material.dart';
import 'package:twazoon/core/routing/routes.dart';
import 'package:twazoon/core/theming/styles.dart';
import 'package:twazoon/core/helpers/spacing.dart';
import 'package:twazoon/core/helpers/extensions.dart';
import 'package:twazoon/core/widgets/app_text_button.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:twazoon/core/widgets/app_text_form_field.dart';

class SecondSignUpForm extends StatelessWidget {
  const SecondSignUpForm({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("الإسم:", style: TextStyles.font16BlackMedium),
              verticalSpace(10),
              AppTextFormField(hintText: "الإسم"),
            ],
          ),
        ),
        verticalSpace(20),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "البريد الإلكتروني الخاص بالكلية:",
                style: TextStyles.font16BlackMedium,
              ),
              verticalSpace(10),
              AppTextFormField(
                hintText: "البريد الإلكتروني الخاص بالكلية",
                keyboardType: TextInputType.emailAddress,
              ),
            ],
          ),
        ),
        verticalSpace(30),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("كلمة المرور:", style: TextStyles.font16BlackMedium),
              verticalSpace(10),
              AppTextFormField(
                hintText: "كلمة المرور",
                isObscureText: true,
                suffixIcon: Icon(
                  Icons.visibility_off,
                  size: 20.sp,
                  color: Colors.grey,
                ),
              ),
            ],
          ),
        ),
        verticalSpace(30),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("تأكيد كلمة المرور:", style: TextStyles.font16BlackMedium),
              verticalSpace(10),
              AppTextFormField(
                hintText: "تأكيد كلمة المرور",
                isObscureText: true,
                suffixIcon: Icon(
                  Icons.visibility_off,
                  size: 20.sp,
                  color: Colors.grey,
                ),
              ),
            ],
          ),
        ),
        verticalSpace(50),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.w),
          child: AppTextButton(
            textButton: "إنشاء حساب",
            onPressed: () {},
            borderRadius: 10.r,
          ),
        ),
        verticalSpace(20),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("تمتلك حساب ؟ ", style: TextStyles.font14BlackMedium),
            GestureDetector(
              onTap: () {
                context.pushNamed(Routes.loginScreen);
              },
              child: Text(
                "تسجيل الدخول",
                style: TextStyles.font14DarkLavenderBold,
              ),
            ),
          ],
        ),
        verticalSpace(20),
      ],
    );
  }
}
