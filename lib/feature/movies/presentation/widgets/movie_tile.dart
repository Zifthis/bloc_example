import 'package:bloc_example/feature/movies/domain/entites/movie_results.dart';
import 'package:flutter/material.dart';

class MovieTile extends StatelessWidget {
  const MovieTile({
    super.key,
    required this.movie,
  });
  final MovieResults movie;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(
        children: [
          Image.network(movie.posterPath ?? ''),
          const SizedBox(height: 10),
          Text(
            movie.title ?? '',
            style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 10),
          Text(movie.overview ?? ''),
          const SizedBox(height: 10),
        ],
      ),
    );
  }
}
