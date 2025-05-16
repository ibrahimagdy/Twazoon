import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:twazoon/core/helpers/shared_pref_helper.dart';
import 'package:twazoon/core/helpers/spacing.dart';
import 'package:twazoon/core/helpers/timer_helper.dart';
import 'package:twazoon/core/theming/colors_manger.dart';
import 'package:twazoon/core/theming/styles.dart';
import 'package:twazoon/core/widgets/app_text_button.dart';
import 'package:twazoon/core/widgets/custom_snack_bar.dart';
import 'package:twazoon/features/auth/otp/data/models/verify_otp_request_model.dart';
import 'package:twazoon/features/auth/otp/logic/verify_otp_cubit.dart';
import 'package:twazoon/features/auth/otp/ui/widgets/otp_bloc_listener.dart';
import 'package:twazoon/features/auth/otp/ui/widgets/otp_input.dart';

class OtpForm extends StatefulWidget {
  const OtpForm({super.key});

  @override
  State<OtpForm> createState() => _OtpFormState();
}

class _OtpFormState extends State<OtpForm> {
  late VerifyOtpCubit cubit;
  late TimerHelper timerHelper;
  String? otp;
  final GlobalKey<OtpInputState> _otpInputKey = GlobalKey<OtpInputState>();

  @override
  void initState() {
    super.initState();
    cubit = BlocProvider.of<VerifyOtpCubit>(context);
    timerHelper = TimerHelper();
    timerHelper.onTimerUpdate = () => setState(() {});
    timerHelper.startResendTimer();
  }

  Future<void> _verifyOtp() async {
    if (otp != null && otp!.length == 6) {
      final email = await SharedPrefHelper.getEmail();
      final requestModel = VerifyOtpRequestModel(
        email: email,
        otp: otp!,
        purposeEnum: 'ResetPassword',
      );
      await SharedPrefHelper.setSecuredString('otp', otp!);
      cubit.verifyOtp(requestModel);
    } else {
      CustomSnackBar.showError(context, 'يرجى إدخال رمز OTP كاملاً');
    }
  }

  void _clearOtpFields() {
    _otpInputKey.currentState?.clearOtpFields();
  }

  Future<void> _resendOtp() async {
    final email = await SharedPrefHelper.getEmail();
    cubit.resendOtp(email, 'ResetPassword');
    timerHelper.startResendTimer();
  }

  @override
  void dispose() {
    timerHelper.dispose();
    super.dispose();
  }

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
        AppTextButton(onPressed: _verifyOtp, textButton: 'التالي'),
        verticalSpace(26),
        TextButton(
          onPressed: timerHelper.isResendEnabled ? _resendOtp : null,
          child: Text(
            timerHelper.isTimerRunning
                ? 'إعادة إرسال الرمز (${timerHelper.resendTimer} ثانية)'
                : 'إعادة إرسال الرمز',
            style: timerHelper.isResendEnabled
                ? TextStyles.font14LavenderBold
                : TextStyles.font14BlackMedium.copyWith(
              color: ColorsManager.grey,
            ),
          ),
        ),
        OtpBlocListener(onInvalidOtp: _clearOtpFields),
      ],
    );
  }
}