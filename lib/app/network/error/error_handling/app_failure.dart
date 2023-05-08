import 'package:bloc_example/app/network/error/model/error_response.dart';
import 'package:bloc_example/generated/l10n.dart';
import 'package:dio/dio.dart';

class AppFailure implements Exception {
  AppFailure({
    required this.title,
    this.description,
  });

  factory AppFailure.fromDioErrorResponse(DioError dioError) {
    final response = ErrorResponse.fromJson(
      dioError.response?.data as Map<String, dynamic>,
    );
    return AppFailure(
      title: response.message ?? S.current.dio_error,
    );
  }

  factory AppFailure.fromFailure(Failure failure) {
    return AppFailure(
      title: failure.title,
      description: failure.description,
    );
  }
  final String title;
  final String? description;
}

enum Failure {
  serverError,
}

extension FailureProperties on Failure {
  static final _title = {
    Failure.serverError: S.current.server_error,
  };
  static final _description = {
    Failure.serverError: S.current.server_error_description,
  };

  String get title => _title[this]!;

  String get description => _description[this]!;

  AppFailure get toAppFailure =>
      AppFailure(title: title, description: description);
}
