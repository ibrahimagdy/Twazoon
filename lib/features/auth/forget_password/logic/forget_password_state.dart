import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:twazoon/core/network/api_error_model.dart';

part 'forget_password_state.freezed.dart';

@freezed
class ForgetPasswordState<T> with _$ForgetPasswordState<T> {
  const factory ForgetPasswordState.initial() = _Initial;

  const factory ForgetPasswordState.loading() = ForgetPasswordLoading;

  const factory ForgetPasswordState.success() = ForgetPasswordSuccess;

  const factory ForgetPasswordState.error({required ApiErrorModel error}) =
      ForgetPasswordError;
}
