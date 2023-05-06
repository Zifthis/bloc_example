import 'package:injectable/injectable.dart';
import 'package:shared_preferences/shared_preferences.dart';

@singleton
class MovieStorage {
  const MovieStorage(SharedPreferences preferences) : _prefs = preferences;

  //Getters

  String? get getMovies {
    return _prefs.getString('user') ?? '';
  }

  //Setters
  set getMovies(String? value) => updateString(
        'user',
        value,
      );

  final SharedPreferences _prefs;

  void updateString(String key, String? value) {
    if (value == null) {
      _prefs.remove(key);
    } else {
      _prefs.setString(key, value);
    }
  }
}


///favs = sl<MovieStorage>().getFavs!;