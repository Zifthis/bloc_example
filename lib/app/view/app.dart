import 'package:bloc_example/feature/movies/movie.dart';
import 'package:bloc_example/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        appBarTheme: const AppBarTheme(color: Color(0xff000000)),
        colorScheme: ColorScheme.fromSwatch(
          accentColor: const Color(0xffFFFFFF),
        ),
      ),
      localizationsDelegates: const [
        S.delegate,
        ...GlobalMaterialLocalizations.delegates,
      ],
      home: const MoviePage(),
    );
  }
}
