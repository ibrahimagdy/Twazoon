import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:twazoon/core/network/api_service.dart';
import 'package:twazoon/core/network/dio_factory.dart';
import 'package:twazoon/features/auth/login/data/repo/login_repo.dart';
import 'package:twazoon/features/auth/login/logic/login_cubit.dart';

final getIt = GetIt.instance;

Future<void> setupGetIt() async {
  // Dio & ApiService
  Dio dio = DioFactory.getDio();
  getIt.registerLazySingleton<ApiService>(() => ApiService(dio));

  // login
  getIt.registerLazySingleton<LoginRepo>(() => LoginRepo(getIt()));
  getIt.registerFactory<LoginCubit>(() => LoginCubit(getIt()));
}
