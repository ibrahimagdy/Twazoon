import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:twazoon/core/helpers/shared_pref_helper.dart';
import 'package:twazoon/features/auth/login/data/model/login_request_body.dart';
import 'package:twazoon/features/auth/login/data/repo/login_repo.dart';
import 'package:twazoon/features/auth/login/logic/login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  final LoginRepo _loginRepo;
  final formKey = GlobalKey<FormState>();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();


  LoginCubit(this._loginRepo) : super(const LoginState.initial());

  void emitLoginStates(String email, String password) async {
    emit(const LoginState.loading());

    final response = await _loginRepo.login(
      LoginRequestBody(
        email: emailController.text,
        password: passwordController.text,
      ),
    );

    response.when(
      success: (loginResponse) async {
        final accessToken = loginResponse.model;

        await SharedPrefHelper.setData(SharedPrefKeys.isLoggedIn, true);
        await SharedPrefHelper.setSecuredString(SharedPrefKeys.userToken, accessToken);

        emit(LoginState.success(
          loginResponse: loginResponse,
        ));
      },
      failure: (error) {
        emit(LoginState.error(error: error));
      },
    );
  }

  @override
  Future<void> close() {
    emailController.dispose();
    passwordController.dispose();
    return super.close();
  }
}