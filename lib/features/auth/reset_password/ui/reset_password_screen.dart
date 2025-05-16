import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:twazoon/core/helpers/spacing.dart';
import 'package:twazoon/core/theming/styles.dart';
import 'package:twazoon/features/auth/reset_password/ui/widgets/reset_password_form.dart';

class ResetPasswordScreen extends StatelessWidget {
  const ResetPasswordScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'أعد ضبط كلمة المرور',
          style: TextStyles.font22LavenderBold,
        ),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20.w),
        child: Column(
          children: [
            verticalSpace(93),
            Text(
              'أدخل كلمة مرور جديده تستطيع تذكرها بشكل جيد',
              style: TextStyles.font16BlackRegular,
              textAlign: TextAlign.center,
            ),
            verticalSpace(32),
            ResetPasswordForm(),
          ],
        ),
      ),
    );
  }
}
