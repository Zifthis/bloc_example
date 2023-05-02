import 'package:freezed_annotation/freezed_annotation.dart';

part 'error_response.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake)
class ErrorResponse {
  final String? code;
  final String? message;

  ErrorResponse({
    this.code,
    this.message,
  });

  factory ErrorResponse.fromJson(Map<String, dynamic> json) =>
      _$ErrorResponseFromJson(json);
}
