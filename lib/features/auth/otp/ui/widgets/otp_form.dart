import 'package:flutter/material.dart';
import 'package:twazoon/core/helpers/spacing.dart';
import 'package:twazoon/core/theming/styles.dart';
import 'package:twazoon/core/widgets/app_text_button.dart';
import 'package:twazoon/features/auth/otp/ui/widgets/otp_text_field.dart';

class OtpForm extends StatefulWidget {
  const OtpForm({super.key});

  @override
  State<OtpForm> createState() => _OtpFormState();
}

class _OtpFormState extends State<OtpForm> {
  final List<FocusNode> _focusNodes = List.generate(6, (_) => FocusNode());
  final List<TextEditingController> _controllers = List.generate(
    6,
    (_) => TextEditingController(),
  );

  void _nextField({required String value, required int index}) {
    if (value.length == 1 && index < 5) {
      FocusScope.of(context).requestFocus(_focusNodes[index + 1]);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      child: Column(
        children: [
          verticalSpace(32),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: List.generate(6, (index) {
              return OtpTextField(
                index: index,
                controller: _controllers[index],
                focusNode: _focusNodes[index],
                onChanged: (value) => _nextField(value: value, index: index),
              );
            }),
          ),
          verticalSpace(22),
          AppTextButton(onPressed: () {}, textButton: 'التالي'),
          verticalSpace(26),
          TextButton(
            onPressed: () {},
            child: Text(
              'إعاده إرسال الرمز',
              style: TextStyles.font14LavenderBold,
            ),
          ),
        ],
      ),
    );
  }
}
