import 'package:bloc_example/app/services/service_locator.dart';
import 'package:bloc_example/feature/movies/domain/cubit/movie_cubit.dart';
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
    return BlocProvider.value(
      value: sl<MovieCubit>()..getNextPage(),
      child: Scaffold(
        appBar: AppBar(),
        body: BlocBuilder<MovieCubit, MovieState>(
          builder: (context, state) {
            return state.maybeWhen(
              loaded: (movies, currentPage) {
                return ListView.builder(
                  itemCount: movies.length,
                  itemBuilder: (context, index) {
                    return ListTile(
                      title: Text(movies[index].title ?? ''),
                      subtitle: Text(movies[index].overview ?? ''),
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
            context.read<MovieCubit>().getNextPage();
          },
          child: const Icon(Icons.arrow_downward),
        ),
      ),
    );
  }
}
