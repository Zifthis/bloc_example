import 'package:bloc_example/app/constants/constants.dart';
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

@module
abstract class MovieDio {
  @singleton
  Dio get dio {
    final dio = Dio();

    dio.options.connectTimeout = 7000;
    dio.options.receiveTimeout = 100000;
    dio.options.queryParameters[Constants.apiKeyName] = Constants.apiKey;
    dio.options.baseUrl = Constants.baseUrl;

    dio.interceptors.add(
      PrettyDioLogger(
        requestHeader: true,
        requestBody: true,
      ),
    );

    return dio;
  }
}
