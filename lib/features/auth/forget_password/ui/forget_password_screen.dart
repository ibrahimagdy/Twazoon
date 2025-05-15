import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:twazoon/core/helpers/spacing.dart';
import 'package:twazoon/core/theming/styles.dart';
import 'package:twazoon/features/auth/forget_password/ui/widgets/forget_password_form.dart';

class ForgetPasswordScreen extends StatelessWidget {
  const ForgetPasswordScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'أدخل البريد الالكتروني',
          style: TextStyles.font22LavenderBold,
        ),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20.w),
        child: Column(
          children: [
            verticalSpace(93),
            Text(
              'إذا نسيت كلمه المرور فلا تقلق '
              'فقط أدخل البريد الجامعي الخاص بك '
              'وسيتم إرسال لك كود التحقق',
              style: TextStyles.font16BlackRegular,
              textAlign: TextAlign.center,
            ),
            ForgetPasswordForm(),
          ],
        ),
      ),
    );
  }
}
