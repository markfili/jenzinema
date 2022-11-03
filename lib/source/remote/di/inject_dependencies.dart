import 'package:dio/dio.dart';
import 'package:flutter_loggy_dio/flutter_loggy_dio.dart';
import 'package:get_it/get_it.dart';

import '../../../app/config.dart';
import '../dio/api_client.dart';
import '../dio/api_interceptor.dart';

void injectDependencies(GetIt getIt) {
  getIt.registerLazySingleton<ApiInterceptor>(
    () => ApiInterceptor(),
  );

  getIt.registerLazySingleton<Dio>(
    () => Dio(
      BaseOptions(
        baseUrl: Config.apiUrl,
        connectTimeout: 5000,
      ),
    )
      ..interceptors.add(LoggyDioInterceptor())
      ..interceptors.add(getIt.get<ApiInterceptor>()),
  );

  getIt.registerLazySingleton<ApiClient>(
    () => ApiClient(getIt.get()),
  );
}
