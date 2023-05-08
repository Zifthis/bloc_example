// ignore_for_file: inference_failure_on_instance_creation
import 'package:bloc_example/app/services/service_locator.dart';
import 'package:bloc_example/feature/favourte_movies/cubit/movie_storage_cubit.dart';
import 'package:bloc_example/feature/movies/domain/entites/movie_results.dart';
import 'package:bloc_example/feature/movies/presentation/widgets/list_tile_widget.dart';
import 'package:bloc_example/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

class FavouriteMoviesPage extends StatelessWidget {
  const FavouriteMoviesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
      value: sl<MovieStorageCubit>()..getMovieList(),
      child: Scaffold(
        backgroundColor: Colors.grey.shade700,
        appBar: AppBar(
          title: Text(S.current.fav_movies),
          actions: [
            Padding(
              padding: const EdgeInsets.all(8),
              child: IconButton(
                onPressed: () {
                  final snackBar = SnackBar(
                    content: Text(
                      S.current.list_empty,
                      textAlign: TextAlign.center,
                    ),
                  );
                  sl<MovieStorageCubit>().deleteAllMovies();
                  ScaffoldMessenger.of(context).showSnackBar(snackBar);
                },
                icon: const Icon(Icons.delete_rounded),
              ),
            ),
          ],
        ),
        body: BlocBuilder<MovieStorageCubit, MovieStorageState>(
          builder: (context, state) {
            return state.maybeWhen(
              loaded: (movies) {
                return ListView.builder(
                  itemCount: movies.length,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.symmetric(vertical: 8),
                      child: Slidable(
                        endActionPane: ActionPane(
                          motion: const ScrollMotion(),
                          children: [
                            SlidableAction(
                              borderRadius: BorderRadius.circular(10),
                              onPressed: (context) {
                                _onSwipe(context, index, movies[index]);
                              },
                              backgroundColor: Colors.red,
                              foregroundColor: Colors.white,
                              icon: Icons.delete,
                              label: S.current.delete,
                            ),
                          ],
                        ),
                        child: ListTileWidget(
                          results: movies[index],
                        ),
                      ),
                    );
                  },
                );
              },
              loading: () => const Center(
                child: CircularProgressIndicator(),
              ),
              error: (failure) => Center(
                child: Text(failure.title),
              ),
              orElse: SizedBox.new,
            );
          },
        ),
      ),
    );
  }

  void _onSwipe(BuildContext ctx, int index, MovieResults movie) {
    final snackBar = SnackBar(
      content: Text(
        '${movie.title} ${S.current.removed_from}',
        textAlign: TextAlign.center,
      ),
    );
    sl<MovieStorageCubit>().deleteMovie(movie, index);
    ScaffoldMessenger.of(ctx).showSnackBar(snackBar);
  }
}
