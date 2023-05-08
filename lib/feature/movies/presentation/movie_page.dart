// ignore_for_file: inference_failure_on_instance_creation
import 'package:bloc_example/app/services/service_locator.dart';
import 'package:bloc_example/feature/favourte_movies/presentation/favourite_movies_page.dart';
import 'package:bloc_example/feature/movie_details/presentation/movie_detials_page.dart';
import 'package:bloc_example/feature/movies/domain/cubit/movie_cubit.dart';
import 'package:bloc_example/feature/movies/domain/entites/movie_results.dart';
import 'package:bloc_example/feature/movies/presentation/widgets/list_tile_widget.dart';
import 'package:bloc_example/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';

class MoviePage extends StatefulWidget {
  const MoviePage({super.key});

  @override
  State<MoviePage> createState() => _MoviePageState();
}

class _MoviePageState extends State<MoviePage> {
  static const _pageSize = 10;
  final PagingController<int, MovieResults> _pagingController =
      PagingController(firstPageKey: 1);

  @override
  void initState() {
    _pagingController.addPageRequestListener(_fetchPage);
    super.initState();
  }

  Future<void> _fetchPage(int pageKey) async {
    try {
      final newItems = await sl<MovieCubit>().getMovieResultsList(pageKey);
      final isLastPage = newItems.length < _pageSize;

      if (isLastPage) {
        _pagingController.appendLastPage(newItems);
      } else {
        final nextPageKey = pageKey + newItems.length;
        _pagingController.appendPage(newItems, nextPageKey);
      }
    } catch (error) {
      _pagingController.error = error;
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
      value: sl<MovieCubit>()..getMoviesList(1),
      child: Scaffold(
        backgroundColor: Colors.black,
        appBar: AppBar(
          title: Text(S.current.upcoming_movies),
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
                return PagedListView<int, MovieResults>(
                  pagingController: _pagingController,
                  builderDelegate: PagedChildBuilderDelegate<MovieResults>(
                    itemBuilder: (context, item, index) => InkWell(
                      onTap: () => Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => MovieDetialsPage(
                            movieResults: movies[index],
                          ),
                        ),
                      ),
                      child: ListTileWidget(
                        results: item,
                      ),
                    ),
                  ),
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

  @override
  void dispose() {
    _pagingController.dispose();
    super.dispose();
  }
}
