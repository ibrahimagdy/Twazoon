import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:twazoon/core/network/api_service.dart';
import 'package:twazoon/core/network/dio_factory.dart';
import 'package:twazoon/features/auth/forget_password/data/repo/forget_password_repo.dart';
import 'package:twazoon/features/auth/forget_password/logic/forget_password_cubit.dart';
import 'package:twazoon/features/auth/login/data/repo/login_repo.dart';
import 'package:twazoon/features/auth/login/logic/login_cubit.dart';
import 'package:twazoon/features/auth/sign_up/data/repo/sign_up_repo.dart';
import 'package:twazoon/features/auth/sign_up/logic/sign_up_cubit.dart';

final getIt = GetIt.instance;

Future<void> setupGetIt() async {
  // Dio & ApiService
  Dio dio = DioFactory.getDio();
  getIt.registerLazySingleton<ApiService>(() => ApiService(dio));

  // login
  getIt.registerLazySingleton<LoginRepo>(() => LoginRepo(getIt()));
  getIt.registerFactory<LoginCubit>(() => LoginCubit(getIt()));
  // sign up
  getIt.registerLazySingleton<SignUpRepo>(() => SignUpRepo(getIt()));
  getIt.registerFactory<SignUpCubit>(() => SignUpCubit(getIt()));
  // forget password
  getIt.registerLazySingleton<ForgetPasswordRepo>(() => ForgetPasswordRepo(getIt()));
  getIt.registerFactory<ForgetPasswordCubit>(() => ForgetPasswordCubit(getIt()));
}
