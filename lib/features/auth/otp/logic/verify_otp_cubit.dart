import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:twazoon/core/helpers/shared_pref_helper.dart';
import 'package:twazoon/features/auth/otp/data/models/verify_otp_request_model.dart';
import 'package:twazoon/features/auth/otp/data/repo/verify_otp_repo.dart';
import 'verify_otp_state.dart';

class VerifyOtpCubit extends Cubit<VerifyOtpState> {
  final VerifyOtpRepo _verifyOtpRepo;
  String? enteredOtp;

  VerifyOtpCubit(this._verifyOtpRepo) : super(const VerifyOtpState.initial());

  Future<void> verifyOtp(VerifyOtpRequestModel requestModel) async {
    emit(const VerifyOtpState.loading());

    final result = await _verifyOtpRepo.verifyOtp(requestModel);

    result.when(
      success: (response) async {
        await SharedPrefHelper.setSecuredString(
          SharedPrefKeys.userToken,
          response.model,
        );
        await SharedPrefHelper.setOtpVerified(true);
        emit(VerifyOtpState.success(response));
      },
      failure: (error) => emit(VerifyOtpState.error(error: error)),
    );
  }
  Future<void> resendOtp(String email, String purpose) async {
    emit(const VerifyOtpState.loading());
    final result = await _verifyOtpRepo.resendOtp(email, purpose);
    result.when(
      success: (_) => emit(const VerifyOtpState.resendSuccess()),
      failure: (error) => emit(VerifyOtpState.error(error: error)),
    );
  }
}
