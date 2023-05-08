import 'package:bloc_example/app/constants/constants.dart';
import 'package:bloc_example/app/services/service_locator.dart';
import 'package:bloc_example/app/utils/time_utils.dart';
import 'package:bloc_example/feature/favourte_movies/cubit/movie_storage_cubit.dart';
import 'package:bloc_example/feature/movies/domain/entites/movie_results.dart';
import 'package:bloc_example/feature/movies/presentation/widgets/custom_text.dart';
import 'package:bloc_example/generated/l10n.dart';
import 'package:flutter/material.dart';

class MovieDetialsPage extends StatelessWidget {
  const MovieDetialsPage({super.key, required this.movieResults});
  final MovieResults movieResults;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: Text(S.current.movie_details),
      ),
      body: DecoratedBox(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: movieResults.posterPath != null &&
                    movieResults.posterPath!.isNotEmpty
                ? NetworkImage(
                    '${Constants.imageUrl}${movieResults.posterPath}',
                  )
                : NetworkImage(
                    '${Constants.imageDefaultUrl}${movieResults.posterPath}',
                  ),
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
                    title: TimeUtils().dateForamt(movieResults.releaseDate!),
                  ),
                  const SizedBox(height: 16),
                  CustomText(
                    title: movieResults.overview ?? '',
                  ),
                  const SizedBox(height: 16),
                  SizedBox(
                    height: 52,
                    width: MediaQuery.of(context).size.width,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.grey.shade700,
                      ),
                      onPressed: () {
                        final snackBar = SnackBar(
                          content: Text(
                            '${movieResults.title} ${S.current.added_to}',
                            textAlign: TextAlign.center,
                          ),
                        );
                        sl<MovieStorageCubit>().addMovie(movieResults);
                        ScaffoldMessenger.of(context).showSnackBar(snackBar);
                      },
                      child: Text(S.current.add_to_fav.toUpperCase()),
                    ),
                  ),
                  const SizedBox(height: 16),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
