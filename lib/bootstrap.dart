import 'dart:async';
import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:bloc_example/app/services/service_locator.dart';
import 'package:bloc_example/feature/movies/domain/entites/movie_results.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:hive_flutter/hive_flutter.dart';

class AppBlocObserver extends BlocObserver {
  const AppBlocObserver();

  @override
  void onChange(BlocBase<dynamic> bloc, Change<dynamic> change) {
    super.onChange(bloc, change);
    log('onChange(${bloc.runtimeType}, $change)');
  }

  @override
  void onError(BlocBase<dynamic> bloc, Object error, StackTrace stackTrace) {
    log('onError(${bloc.runtimeType}, $error, $stackTrace)');
    super.onError(bloc, error, stackTrace);
  }
}

Future<void> bootstrap(FutureOr<Widget> Function() builder) async {
  FlutterError.onError = (details) {
    log(details.exceptionAsString(), stackTrace: details.stack);
  };

  Bloc.observer = const AppBlocObserver();

  await runZonedGuarded(
    () async {
      WidgetsFlutterBinding.ensureInitialized();
      await Hive.initFlutter();
      Hive.registerAdapter(MovieResultsAdapter());
      configureDependencies();

      await SystemChrome.setPreferredOrientations([
        DeviceOrientation.portraitUp,
        DeviceOrientation.portraitDown,
      ]);
      runApp(await builder());
    },
    (error, stackTrace) => log(error.toString(), stackTrace: stackTrace),
  );
}
