import 'package:bloc_example/app/services/service_locator.config.dart';
import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';
import 'package:shared_preferences/shared_preferences.dart';

final sl = GetIt.instance;
bool isDependencyInitialized = false;

@InjectableInit(asExtension: false)
void configureDependencies() => init(sl);

@module
abstract class RegisterModule {
  Future<SharedPreferences> get prefs => SharedPreferences.getInstance();
}
