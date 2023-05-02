import 'package:bloc_example/feature/movies/domain/cubit/movie_cubit.dart';
import 'package:bloc_example/feature/movies/presentation/widgets/movie_tile.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MoviePage extends StatefulWidget {
  const MoviePage({super.key});

  @override
  State<MoviePage> createState() => _MoviePageState();
}

class _MoviePageState extends State<MoviePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: BlocConsumer<MovieCubit, MovieState>(
          listener: (context, state) {
            return;
          },
          builder: (context, state) {
            return state.maybeWhen(
              orElse: SizedBox.new,
              error: (failure) => Center(child: Text(failure.title)),
              loading: () =>
                  const Center(child: CircularProgressIndicator.adaptive()),
              loaded: (movieResults) => ListView.builder(
                itemCount: movieResults.length,
                itemBuilder: (ctx, index) {
                  return MovieTile(movie: movieResults[index]);
                },
              ),
            );
          },
        ),
      ),
    );
  }
}
