import 'package:flutter/material.dart';
import 'package:twazoon/core/theming/styles.dart';
import 'package:twazoon/core/helpers/spacing.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:twazoon/core/widgets/app_text_form_field.dart';

class SecondSignUpScreen extends StatelessWidget {
  const SecondSignUpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text("الإسم:", style: TextStyles.font16BlackMedium),
        verticalSpace(10),
        AppTextFormField(hintText: "اسم الطالب"),
        verticalSpace(17),
        Text(
          "البريد الإلكتروني",
          style: TextStyles.font16BlackMedium,
        ),
        verticalSpace(10),
        AppTextFormField(
          hintText: "البريد الإلكتروني الخاص بالكلية",
          keyboardType: TextInputType.emailAddress,
        ),
        verticalSpace(17),
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
        verticalSpace(17),
        Text("تأكيد كلمة المرور:", style: TextStyles.font16BlackMedium),
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
    );
  }
}
