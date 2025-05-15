import 'api_constants.dart';
import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';
import 'package:twazoon/features/auth/login/data/model/login_request_body.dart';
import 'package:twazoon/features/auth/login/data/model/login_response_body.dart';
import 'package:twazoon/features/auth/sign_up/data/models/sign_up_request_model.dart';
import 'package:twazoon/features/auth/sign_up/data/models/sign_up_response_model.dart';
import 'package:twazoon/features/auth/forget_password/data/models/forget_password_request_model.dart';

part 'api_service.g.dart';

@RestApi(baseUrl: ApiConstants.apiBaseUrl)
abstract class ApiService {
  factory ApiService(Dio dio, {String baseUrl}) = _ApiService;

  @POST(ApiConstants.login)
  Future<LoginResponseBody> login(@Body() LoginRequestBody loginRequestBody);

  @POST(ApiConstants.register)
  Future<SignUpResponseModel> signUp(
    @Body() SignUpRequestModel signUpRequestModel,
  );

  @POST(ApiConstants.forgetPassword)
  Future<void> forgetPassword(
    @Body() ForgetPasswordRequestModel forgetPasswordRequestModel,
  );
}
