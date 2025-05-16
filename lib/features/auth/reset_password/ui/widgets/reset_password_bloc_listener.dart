import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:twazoon/core/helpers/extensions.dart';
import 'package:twazoon/core/routing/routes.dart';
import 'package:twazoon/core/widgets/custom_snack_bar.dart';
import 'package:twazoon/core/widgets/loading_circle_indicator.dart';
import 'package:twazoon/features/auth/reset_password/logic/reset_password_cubit.dart';
import 'package:twazoon/features/auth/reset_password/logic/reset_password_state.dart';

class ResetPasswordBlocListener extends StatelessWidget {
  const ResetPasswordBlocListener({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<ResetPasswordCubit, ResetPasswordState>(
      listener: (context, state) {
        state.whenOrNull(
          resetPasswordLoading: () {
            showDialog(
              context: context,
              barrierDismissible: false,
              builder: (context) => LoadingCircleIndicator(),
            );
          },
          resetPasswordSuccess: (message) {
            Navigator.pop(context);
            CustomSnackBar.showSuccess(context, message);
            context.pushReplacementNamed(Routes.loginScreen);
          },
          error: (error) {
            Navigator.pop(context);
            CustomSnackBar.showError(context, error.getAllErrorMessages());
          },
        );
      },
      child: const SizedBox.shrink(),
    );
  }
}
