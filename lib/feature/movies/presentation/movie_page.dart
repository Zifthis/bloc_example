import 'package:bloc_example/app/services/service_locator.dart';
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
        appBar: AppBar(title: const Text('Upcoming Movies')),
        body: BlocBuilder<MovieCubit, MovieState>(
          builder: (context, state) {
            return state.maybeWhen(
              loaded: (movies, currentPage) {
                return ListView.builder(
                  itemCount: movies.length,
                  itemBuilder: (context, index) {
                    return ListTileWidget(
                      results: movies[index],
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
