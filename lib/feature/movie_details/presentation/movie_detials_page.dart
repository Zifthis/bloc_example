import 'package:bloc_example/app/constants/constants.dart';
import 'package:bloc_example/feature/movies/domain/entites/movie_results.dart';
import 'package:bloc_example/feature/movies/presentation/widgets/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class MovieDetialsPage extends StatelessWidget {
  const MovieDetialsPage({super.key, required this.movieResults});
  final MovieResults movieResults;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Movie Details'),
      ),
      body: DecoratedBox(
        decoration: BoxDecoration(
          image: DecorationImage(
            image:
                NetworkImage('${Constants.imageUrl}${movieResults.posterPath}'),
            fit: BoxFit.cover,
          ),
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Colors.black.withOpacity(0.4),
              Colors.black.withOpacity(0.8),
            ],
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CustomText(title: movieResults.title ?? ''),
                  const SizedBox(height: 8),
                  CustomText(
                    title: _dateForamt(movieResults.releaseDate!),
                  ),
                  const SizedBox(height: 16),
                  CustomText(
                    title: movieResults.overview ?? '',
                  ),
                  const SizedBox(height: 36),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  String _dateForamt(DateTime dateString) {
    final formattedDate = DateFormat('MMMM d, y').format(dateString);
    return formattedDate;
  }
}
