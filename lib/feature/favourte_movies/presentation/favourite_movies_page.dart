import 'package:flutter/material.dart';

class FavouriteMoviesPage extends StatelessWidget {
  const FavouriteMoviesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Favourite Movies')),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: const [Center(child: Text('fav movies!'))],
      ),
    );
  }
}
