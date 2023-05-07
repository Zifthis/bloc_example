// ignore_for_file: inference_failure_on_instance_creation
import 'package:bloc_example/app/services/service_locator.dart';
import 'package:bloc_example/feature/favourte_movies/presentation/favourite_movies_page.dart';
import 'package:bloc_example/feature/movie_details/presentation/movie_detials_page.dart';
import 'package:bloc_example/feature/movies/domain/cubit/movie_cubit.dart';
import 'package:bloc_example/feature/movies/presentation/widgets/list_tile_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MoviePage extends StatefulWidget {
  const MoviePage({super.key});

  @override
  State<MoviePage> createState() => _MoviePageState();
}

class _MoviePageState extends State<MoviePage> {
  int currentPage = 1;
  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
      value: sl<MovieCubit>()..getNextPage(currentPage),
      child: Scaffold(
        backgroundColor: Colors.black,
        appBar: AppBar(
          title: const Text('Upcoming Movies'),
          actions: [
            Padding(
              padding: const EdgeInsets.all(8),
              child: IconButton(
                onPressed: () => Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const FavouriteMoviesPage(),
                  ),
                ),
                icon: const Icon(Icons.favorite_outline_rounded),
              ),
            ),
          ],
        ),
        body: BlocBuilder<MovieCubit, MovieState>(
          builder: (context, state) {
            return state.maybeWhen(
              loaded: (movies, currentPage) {
                return ListView.builder(
                  padding: EdgeInsets.zero,
                  itemCount: movies.length,
                  itemBuilder: (context, index) {
                    return InkWell(
                      onTap: () => Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => MovieDetialsPage(
                            movieResults: movies[index],
                          ),
                        ),
                      ),
                      child: ListTileWidget(
                        results: movies[index],
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
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            sl<MovieCubit>().getNextPage(currentPage++);
          },
          child: const Icon(Icons.arrow_downward),
        ),
      ),
    );
  }
}
