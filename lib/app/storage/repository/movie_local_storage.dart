// ignore_for_file: unawaited_futures, unnecessary_statements
import 'package:bloc_example/app/constants/constants.dart';
import 'package:bloc_example/app/storage/repository/i_movie_local_storage.dart';
import 'package:bloc_example/core/domain/error_handling/app_failure.dart';
import 'package:bloc_example/core/domain/error_handling/either_failure_or.dart';
import 'package:bloc_example/feature/movies/domain/entites/movie_results.dart';
import 'package:dartz/dartz.dart';
import 'package:hive/hive.dart';
import 'package:injectable/injectable.dart';

@Singleton(as: IMovieLocalStorage)
class MovieLocalStorage extends IMovieLocalStorage {
  Future<Box<MovieResults>> openBox() async {
    final box = await Hive.openBox<MovieResults>(Constants.boxLabel);
    return box;
  }

  @override
  EitherAppFailureOr<List<MovieResults>> getMovieList() async {
    try {
      final box = await openBox();
      return Right(box.values.toList());
    } catch (e) {
      return Left(AppFailure(title: e.toString()));
    }
  }

  @override
  EitherAppFailureOr<Unit> addMovieToList(MovieResults movie) async {
    try {
      final box = await openBox();
      box.values.any((element) => element.title!.contains(movie.title!))
          ? null
          : box.add(movie);
      return const Right(unit);
    } catch (e) {
      return Left(AppFailure(title: e.toString()));
    }
  }

  @override
  EitherAppFailureOr<Unit> removeMovieFromList(int index) async {
    try {
      final box = await openBox();
      await box.deleteAt(index);
      return const Right(unit);
    } catch (e) {
      return Left(AppFailure(title: e.toString()));
    }
  }

  @override
  EitherAppFailureOr<Unit> clearMovieList() async {
    try {
      final box = await openBox();
      await box.clear();
      return const Right(unit);
    } catch (e) {
      return Left(AppFailure(title: e.toString()));
    }
  }
}
