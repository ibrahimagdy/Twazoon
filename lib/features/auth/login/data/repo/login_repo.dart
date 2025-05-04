import 'package:twazoon/core/network/api_error_handler.dart';
import 'package:twazoon/core/network/api_result.dart';
import 'package:twazoon/core/network/api_service.dart';
import 'package:twazoon/features/auth/login/data/model/login_request_body.dart';
import 'package:twazoon/features/auth/login/data/model/login_response_body.dart';

class LoginRepo {
  final ApiService _apiService;

  LoginRepo(this._apiService);

  Future<ApiResult<LoginResponseBody>> login(
      LoginRequestBody loginRequestBody) async {
    try {
      final response = await _apiService.login(loginRequestBody);
      return ApiResult.success(response);
    } catch (error) {
      return ApiResult.failure(ApiErrorHandler.handle(error));
    }
  }
}