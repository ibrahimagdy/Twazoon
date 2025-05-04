import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:twazoon/core/network/api_error_model.dart';
import 'package:twazoon/features/auth/login/data/model/login_response_body.dart';

part 'login_state.freezed.dart';

@freezed
class LoginState with _$LoginState {
  const factory LoginState.initial() = _Initial;

  const factory LoginState.loading() = _Loading;

  const factory LoginState.success({required LoginResponseBody loginResponse}) =
      _Success;

  const factory LoginState.error({required ApiErrorModel error}) = _Error;
}
