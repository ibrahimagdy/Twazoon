import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:twazoon/core/helpers/spacing.dart';
import 'package:twazoon/core/theming/styles.dart';
import 'package:twazoon/features/auth/otp/ui/widgets/otp_form.dart';

class OtpScreen extends StatelessWidget {
  const OtpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.ltr,
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            'أدخل الكود',
            style: TextStyles.font22LavenderBold,
          ),
        ),
        body: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.w),
          child: Column(
            children: [
              verticalSpace(93),
              Text(
                'تم إرسال رمز التحقق إلى بريدك الجامعي.'
                    ' أدخل الرمز من اليسار إلى اليمين هنا لإكمال العملية',
                style: TextStyles.font16BlackRegular,
                textAlign: TextAlign.center,
              ),
              OtpForm(),
            ],
          ),
        ),
      ),
    );
  }
}