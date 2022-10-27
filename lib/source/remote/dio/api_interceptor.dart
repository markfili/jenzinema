import 'package:dio/dio.dart';

import '../../../app/config.dart';

class ApiInterceptor extends Interceptor {
  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    options.headers["Authorization"] = "Bearer ${Config.apiAuthToken}";
    super.onRequest(options, handler);
  }
}
