import 'package:bloc_example/core/domain/error_handling/app_failure.dart';
import 'package:dartz/dartz.dart';

typedef EitherAppFailureOr<T> = Future<Either<AppFailure, T>>;
