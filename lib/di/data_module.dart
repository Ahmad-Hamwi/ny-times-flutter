import 'package:ny_times_flutter/data/remote/api/articles_backend_api.dart';
import 'package:ny_times_flutter/data/remote/constants/api_endpoints.dart';
import 'package:ny_times_flutter/data/remote/interceptor/api_key_interceptor.dart';
import 'package:dio/dio.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

import 'di_container.dart';

void registerDataLayer() {
  sl.registerLazySingleton<IArticleApi>(
    () => IArticleApi(sl<Dio>(), baseUrl: ApiEndpoints.baseUrl),
  );

  sl.registerLazySingleton<Dio>(
    () => Dio(
      BaseOptions(
        sendTimeout: const Duration(seconds: 15),
        receiveTimeout: const Duration(seconds: 15),
      ),
    )..interceptors.addAll([
        sl<ApiKeyInterceptor>(),
        sl<PrettyDioLogger>(),
      ]),
  );

  sl.registerLazySingleton<PrettyDioLogger>(
    () => PrettyDioLogger(
      requestHeader: true,
      requestBody: true,
      responseBody: true,
      responseHeader: false,
      error: true,
      compact: true,
      maxWidth: 90,
    ),
  );

  sl.registerLazySingleton<ApiKeyInterceptor>(
    () => ApiKeyInterceptor(),
  );
}
