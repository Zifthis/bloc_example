import 'package:bloc_example/core/constants/constants.dart';
import 'package:dio/dio.dart';

class HeaderInterceptor extends Interceptor {
  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    options.headers[Constants.apiKeyName] = Constants.apiKey;
    return super.onRequest(options, handler);
  }
}
