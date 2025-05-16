import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:twazoon/core/helpers/extensions.dart';
import 'package:twazoon/core/routing/routes.dart';
import 'package:twazoon/core/widgets/custom_snack_bar.dart';
import 'package:twazoon/core/widgets/loading_circle_indicator.dart';
import 'package:twazoon/features/auth/otp/data/models/verify_otp_response_model.dart';
import 'package:twazoon/features/auth/otp/logic/verify_otp_cubit.dart';
import 'package:twazoon/features/auth/otp/logic/verify_otp_state.dart';

class OtpBlocListener extends StatelessWidget {
  final Function()? onInvalidOtp;

  const OtpBlocListener({
    super.key,
    this.onInvalidOtp,
  });

  @override
  Widget build(BuildContext context) {
    return BlocListener<VerifyOtpCubit, VerifyOtpState>(
      listener: (context, state) {
        state.when(
          initial: () {},
          loading: () {
            showDialog(
              context: context,
              barrierDismissible: false,
              builder: (context) => LoadingCircleIndicator(),
            );
          },
          success: (data) {
            Navigator.pop(context);
            final response = data as VerifyOtpResponseModel;
            CustomSnackBar.showSuccess(context, response.message);
            context.pushNamed(Routes.resetPasswordScreen);
          },
          resendSuccess: () {
            Navigator.pop(context);
            CustomSnackBar.showSuccess(context, 'تم إعادة إرسال الرمز بنجاح');
          },
          error: (error) {
            Navigator.pop(context);
            CustomSnackBar.showError(context, error.getAllErrorMessages());
            if (onInvalidOtp != null) {
              onInvalidOtp!();
            }
          },
        );
      },
      child: const SizedBox.shrink(),
    );
  }
}