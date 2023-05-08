import 'package:bloc_example/app/constants/constants.dart';
import 'package:bloc_example/app/utils/time_utils.dart';
import 'package:bloc_example/feature/movies/domain/entites/movie_results.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class ListTileWidget extends StatelessWidget {
  const ListTileWidget({
    required this.results,
    super.key,
  });
  final MovieResults results;

  @override
  Widget build(BuildContext context) => SizedBox(
        height: 400,
        width: MediaQuery.of(context).size.width,
        child: Card(
          child: Stack(
            children: [
              //TODO: error handling
              CachedNetworkImage(
                imageUrl: '${Constants.imageUrl}${results.posterPath}' ??
                    'https://placehold.co/600x400',
                fit: BoxFit.cover,
                width: double.infinity,
                height: double.infinity,
              ),
              Positioned(
                bottom: 0,
                left: 0,
                right: 0,
                child: Container(
                  padding: const EdgeInsets.all(12),
                  color: Colors.black.withOpacity(0.6),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 4),
                        child: Text(
                          results.title ?? '',
                          style: const TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 16,
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(bottom: 4),
                        child: Row(
                          children: [
                            Icon(
                              Icons.star,
                              color: Colors.yellow[700],
                              size: 20,
                            ),
                            const SizedBox(width: 5),
                            Text(
                              results.voteAverage.toString(),
                              style: const TextStyle(
                                color: Colors.white,
                                fontSize: 16,
                              ),
                            ),
                            const SizedBox(width: 10),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(bottom: 4),
                        child: Text(
                          TimeUtils().dateForamt(results.releaseDate!),
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 16,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      );
}
