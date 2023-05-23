import 'package:bloc_example/app/services/service_locator.config.dart';
import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';

final serviceLocator = GetIt.instance;

@InjectableInit(asExtension: false)
void configureDependencies() => init(serviceLocator);
