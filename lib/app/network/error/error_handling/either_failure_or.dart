import 'package:bloc_example/app/network/error/error_handling/app_failure.dart';
import 'package:dartz/dartz.dart';

typedef EitherAppFailureOr<T> = Future<Either<AppFailure, T>>;
