import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:twazoon/core/network/api_error_model.dart';

part 'verify_otp_state.freezed.dart';

@freezed
class VerifyOtpState<T> with _$VerifyOtpState<T> {
  const factory VerifyOtpState.initial() = _Initial;

  const factory VerifyOtpState.loading() = VerifyOtpLoading;
  const factory VerifyOtpState.success(T data) = VerifyOtpSuccess<T>;
  const factory VerifyOtpState.error({required ApiErrorModel error}) = VerifyOtpError;
}