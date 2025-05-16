import 'package:flutter/material.dart';
import 'package:twazoon/core/helpers/spacing.dart';
import 'package:twazoon/core/theming/styles.dart';
import 'package:twazoon/core/widgets/app_text_button.dart';
import 'package:twazoon/features/auth/otp/ui/widgets/otp_input.dart';

class VerifySignUpForm extends StatefulWidget {
  const VerifySignUpForm({super.key});

  @override
  State<VerifySignUpForm> createState() => _VerifySignUpFormState();
}

class _VerifySignUpFormState extends State<VerifySignUpForm> {
  String? otp;
  final GlobalKey<OtpInputState> _otpInputKey = GlobalKey<OtpInputState>();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        OtpInput(
          key: _otpInputKey,
          onChanged: (value) {
            setState(() {
              otp = value;
            });
          },
        ),
        verticalSpace(22),
        AppTextButton(onPressed: (){}, textButton: 'الدخول إلى التطبيق'),
        verticalSpace(26),
        TextButton(
          onPressed: (){},
          child: Text(
            'إعادة إرسال الرمز',
            style:  TextStyles.font14LavenderBold
          ),
        ),
      ],
    );
  }
}