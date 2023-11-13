import 'package:ny_times_flutter/data/remote/constants/api_endpoints.dart';
import 'package:dio/dio.dart';

class ApiKeyInterceptor extends Interceptor {
  ApiKeyInterceptor();

  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    options.queryParameters.addAll({"api-key": ApiKeys.newYorkApiKey});

    handler.next(options);
  }
}
