// ignore_for_file: inference_failure_on_instance_creation

import 'package:bloc_example/app/services/service_locator.dart';
import 'package:bloc_example/app/storage/cubit/movie_storage_cubit.dart';
import 'package:bloc_example/feature/movie_details/presentation/movie_detials_page.dart';
import 'package:bloc_example/feature/movies/presentation/widgets/list_tile_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class FavouriteMoviesPage extends StatelessWidget {
  const FavouriteMoviesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
      value: sl<MovieStorageCubit>()..getCityList(),
      child: Scaffold(
        appBar: AppBar(title: const Text('Favourite Movies')),
        body: BlocBuilder<MovieStorageCubit, MovieStorageState>(
          builder: (context, state) {
            return state.maybeWhen(
              loaded: (movies) {
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
      ),
    );
  }
}
