import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:twazoon/core/helpers/extensions.dart';
import 'package:twazoon/core/routing/routes.dart';
import 'package:twazoon/core/widgets/custom_snack_bar.dart';
import 'package:twazoon/core/widgets/loading_circle_indicator.dart';
import 'package:twazoon/features/auth/login/logic/login_cubit.dart';
import 'package:twazoon/features/auth/login/logic/login_state.dart';

class LoginBlocListener extends StatelessWidget {
  const LoginBlocListener({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<LoginCubit, LoginState>(
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
          success: (loginResponse) {
            Navigator.of(context).pop();
            context.pushNamedAndRemoveUntil(
              Routes.homeScreen,
              predicate: (Route<dynamic> route) => false,
            );
            CustomSnackBar.showSuccess(context, loginResponse.message);
          },
          error: (error) {
            Navigator.of(context).pop();
            CustomSnackBar.showError(context, error.getAllErrorMessages());
          },
        );
      },
      child: const SizedBox.shrink(),
    );
  }
}
