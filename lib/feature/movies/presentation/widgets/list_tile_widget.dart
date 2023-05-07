import 'package:bloc_example/app/constants/constants.dart';
import 'package:bloc_example/feature/movies/domain/entites/movie_results.dart';
import 'package:flutter/material.dart';

class ListTileWidget extends StatelessWidget {
  const ListTileWidget({
    required this.results,
    super.key,
  });
  final MovieResults results;

  @override
  Widget build(BuildContext context) => ListTile(
        leading: results.posterPath != null
            ? CircleAvatar(
                radius: 25,
                backgroundImage:
                    NetworkImage('${Constants.imageUrl}${results.posterPath}'),
              )
            : const CircleAvatar(
                radius: 25,
                backgroundImage: NetworkImage(
                  Constants.imageDefaultUrl,
                ),
              ),
        title: Text(
          results.title ?? '',
          style: const TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.w700,
          ),
          maxLines: 1,
        ),
        trailing: SizedBox(
          height: 35,
          width: 35,
          child: CircleAvatar(
            backgroundColor: Colors.amber,
            child: Text(
              results.voteAverage.toString(),
              style: const TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.w700,
              ),
              textAlign: TextAlign.center,
            ),
          ),
        ),
      );
}
