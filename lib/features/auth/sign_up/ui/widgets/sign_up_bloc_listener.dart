import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:twazoon/core/helpers/extensions.dart';
import 'package:twazoon/core/routing/routes.dart';
import 'package:twazoon/core/widgets/custom_snack_bar.dart';
import 'package:twazoon/core/widgets/loading_circle_indicator.dart';
import 'package:twazoon/features/auth/sign_up/data/models/sign_up_response_model.dart';
import 'package:twazoon/features/auth/sign_up/logic/sign_up_cubit.dart';
import 'package:twazoon/features/auth/sign_up/logic/sign_up_state.dart';

class SignUpBlocListener extends StatelessWidget {
  const SignUpBlocListener({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<SignUpCubit, SignUpState>(
      listener: (context, state) {
        state.map(
          initial: (_) {},
          signUpLoading: (_) {
            showDialog(
              context: context,
              barrierDismissible: false,
              builder: (context) => LoadingCircleIndicator(),
            );
          },
          signUpSuccess: (data) {
            final message = data.data is SignUpResponseModel
                    ? (data.data as SignUpResponseModel).message
                    : "Account created successfully";
            CustomSnackBar.showSuccess(context, message);
            context.pushNamedAndRemoveUntil(
              Routes.verifySignUpScreen,
              predicate: (Route<dynamic> route) => false,
            );
          },
          signUpError: (errorState) {
            Navigator.of(context).pop();
            CustomSnackBar.showError(
              context,
              errorState.error.getAllErrorMessages(),
            );
          },
        );
      },
      child: const SizedBox.shrink(),
    );
  }
}
