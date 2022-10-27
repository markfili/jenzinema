import 'package:dio/dio.dart';
import 'package:dio_cache_interceptor/dio_cache_interceptor.dart';
import 'package:dio_cache_interceptor_hive_store/dio_cache_interceptor_hive_store.dart';
import 'package:flutter_loggy_dio/flutter_loggy_dio.dart';
import 'package:get_it/get_it.dart';

import '../../../app/config.dart';
import '../dio/api_client.dart';
import '../dio/api_interceptor.dart';

void injectDependencies(GetIt getIt, String tmpDirPath) {
  getIt.registerLazySingleton<ApiInterceptor>(
    () => ApiInterceptor(),
  );

  getIt.registerLazySingleton<CacheOptions>(() {
    var store = HiveCacheStore(tmpDirPath);
    return CacheOptions(
      store: store,
      policy: CachePolicy.forceCache,
      priority: CachePriority.high,
      maxStale: const Duration(minutes: 5),
      hitCacheOnErrorExcept: [401, 404],
      keyBuilder: (request) {
        return request.uri.toString();
      },
      allowPostMethod: false,
    );
  });

  getIt.registerLazySingleton<Dio>(
    () => Dio(
      BaseOptions(
        baseUrl: Config.apiUrl,
      ),
    )
      ..interceptors.add(LoggyDioInterceptor())
      ..interceptors.add(DioCacheInterceptor(options: getIt.get<CacheOptions>()))
      ..interceptors.add(getIt.get<ApiInterceptor>()),
  );

  getIt.registerLazySingleton<ApiClient>(
    () => ApiClient(getIt.get()),
  );
}
