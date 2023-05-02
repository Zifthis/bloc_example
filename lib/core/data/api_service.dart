import 'package:bloc_example/core/constants/constants.dart';
import 'package:bloc_example/core/data/api_client/api_client.dart';
import 'package:bloc_example/core/data/interceptors/header_interceptor.dart';
import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

class ApiService {
  static void register() {
    final getIt = GetIt.instance;

    final dio = Dio(
      BaseOptions(baseUrl: Constants.baseUrl),
    )..interceptors.addAll(
        [
          PrettyDioLogger(requestHeader: true, requestBody: true),
          HeaderInterceptor()
        ],
      );
    final myApi = ApiClient(dio);

    getIt
      ..registerSingleton<Dio>(dio)
      ..registerSingleton<ApiClient>(myApi);
  }

  static ApiClient get myApi => GetIt.instance<ApiClient>();
}
