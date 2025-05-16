import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:twazoon/core/helpers/shared_pref_helper.dart';
import 'package:twazoon/core/network/api_error_model.dart';
import 'package:twazoon/features/auth/reset_password/data/models/reset_password_request_model.dart';
import 'package:twazoon/features/auth/reset_password/data/repo/reset_password_repo.dart';
import 'package:twazoon/features/auth/reset_password/logic/reset_password_state.dart';

class ResetPasswordCubit extends Cubit<ResetPasswordState> {
  final ResetPasswordRepo _resetPasswordRepo;
  String? _email;
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final TextEditingController newPasswordController = TextEditingController();
  final TextEditingController confirmPasswordController =
  TextEditingController();
  bool isPasswordHidden = true;
  bool isConfirmPasswordHidden = true;

  ResetPasswordCubit(this._resetPasswordRepo)
      : super(const ResetPasswordState.initial()) {
    _loadStoredData();
  }

  Future<void> _loadStoredData() async {
    emit(const ResetPasswordState.loadingStoredData());
    try {
      final email = await SharedPrefHelper.getString('email');
      _email = email;
      emit(
        ResetPasswordState.storedDataLoaded(
          isPasswordHidden: isPasswordHidden,
          isConfirmPasswordHidden: isConfirmPasswordHidden,
        ),
      );
    } catch (e) {
      emit(
        ResetPasswordState.error(
          error: ApiErrorModel(message: 'Failed to load stored data: $e'),
        ),
      );
    }
  }

  void togglePasswordVisibility() {
    isPasswordHidden = !isPasswordHidden;
    emit(
      ResetPasswordState.storedDataLoaded(
        isPasswordHidden: isPasswordHidden,
        isConfirmPasswordHidden: isConfirmPasswordHidden,
      ),
    );
  }

  void toggleConfirmPasswordVisibility() {
    isConfirmPasswordHidden = !isConfirmPasswordHidden;
    emit(
      ResetPasswordState.storedDataLoaded(
        isPasswordHidden: isPasswordHidden,
        isConfirmPasswordHidden: isConfirmPasswordHidden,
      ),
    );
  }

  Future<void> resetPassword() async {
    if (_email == null) {
      emit(
        ResetPasswordState.error(
          error: ApiErrorModel(message: 'Email or OTP not loaded'),
        ),
      );
      return;
    }
    if (!formKey.currentState!.validate()) {
      return;
    }
    emit(const ResetPasswordState.resetPasswordLoading());
    final requestModel = ResetPasswordRequestModel(
      email: _email!,
      password: newPasswordController.text,
      confirmPassword: confirmPasswordController.text,
    );
    final result = await _resetPasswordRepo.resetPassword(requestModel);
    result.when(
      success: (response) => emit(ResetPasswordState.resetPasswordSuccess(
        message: response.message,
      )),
      failure: (error) => emit(ResetPasswordState.error(error: error)),
    );
  }
}