import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:twazoon/features/auth/forget_password/data/models/forget_password_request_model.dart';
import 'package:twazoon/features/auth/forget_password/data/repo/forget_password_repo.dart';
import 'package:twazoon/features/auth/forget_password/logic/forget_password_state.dart';

class ForgetPasswordCubit extends Cubit<ForgetPasswordState> {
  final ForgetPasswordRepo _forgetPasswordRepo;
  final formKey = GlobalKey<FormState>();
  final TextEditingController emailController = TextEditingController();

  ForgetPasswordCubit(this._forgetPasswordRepo)
    : super(const ForgetPasswordState.initial());

  void forgetPassword(String email) async {
    emit(const ForgetPasswordState.loading());

    final response = await _forgetPasswordRepo.forgetPassword(
      ForgetPasswordRequestModel(email: email, purpose: 'ResetPassword'),
    );

    response.when(
      success: (_) => emit(ForgetPasswordState.success()),
      failure: (error) => emit(ForgetPasswordState.error(error: error)),
    );
  }
  @override
  Future<void> close() {
    emailController.dispose();
    return super.close();
  }
}
