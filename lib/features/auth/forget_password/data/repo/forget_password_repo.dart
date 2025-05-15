import 'package:twazoon/core/network/api_error_handler.dart';
import 'package:twazoon/core/network/api_result.dart';
import 'package:twazoon/core/network/api_service.dart';
import 'package:twazoon/features/auth/forget_password/data/models/forget_password_request_model.dart';

class ForgetPasswordRepo {
  final ApiService _apiService;

  ForgetPasswordRepo(this._apiService);

  Future<ApiResult<void>> forgetPassword(
      ForgetPasswordRequestModel forgetPasswordRequestModel) async {
    try {
      final response = await _apiService.forgetPassword(forgetPasswordRequestModel);
      return ApiResult.success(response);
    } catch (error) {
      return ApiResult.failure(ApiErrorHandler.handle(error));
    }
  }
}