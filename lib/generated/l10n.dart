// GENERATED CODE - DO NOT MODIFY BY HAND
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'intl/messages_all.dart';

// **************************************************************************
// Generator: Flutter Intl IDE plugin
// Made by Localizely
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, lines_longer_than_80_chars
// ignore_for_file: join_return_with_assignment, prefer_final_in_for_each
// ignore_for_file: avoid_redundant_argument_values, avoid_escaping_inner_quotes

class S {
  S();

  static S? _current;

  static S get current {
    assert(_current != null,
        'No instance of S was loaded. Try to initialize the S delegate before accessing S.current.');
    return _current!;
  }

  static const AppLocalizationDelegate delegate = AppLocalizationDelegate();

  static Future<S> load(Locale locale) {
    final name = (locale.countryCode?.isEmpty ?? false)
        ? locale.languageCode
        : locale.toString();
    final localeName = Intl.canonicalizedLocale(name);
    return initializeMessages(localeName).then((_) {
      Intl.defaultLocale = localeName;
      final instance = S();
      S._current = instance;

      return instance;
    });
  }

  static S of(BuildContext context) {
    final instance = S.maybeOf(context);
    assert(instance != null,
        'No instance of S present in the widget tree. Did you add S.delegate in localizationsDelegates?');
    return instance!;
  }

  static S? maybeOf(BuildContext context) {
    return Localizations.of<S>(context, S);
  }

  /// `Test title here`
  String get counter_appbar_title {
    return Intl.message(
      'Test title here',
      name: 'counter_appbar_title',
      desc: '',
      args: [],
    );
  }

  /// `Server Error`
  String get server_error {
    return Intl.message(
      'Server Error',
      name: 'server_error',
      desc: '',
      args: [],
    );
  }

  /// `Something went wrong!`
  String get server_error_description {
    return Intl.message(
      'Something went wrong!',
      name: 'server_error_description',
      desc: '',
      args: [],
    );
  }

  /// `Dio Error`
  String get dio_error {
    return Intl.message(
      'Dio Error',
      name: 'dio_error',
      desc: '',
      args: [],
    );
  }

  /// `Favorite Movies`
  String get fav_movies {
    return Intl.message(
      'Favorite Movies',
      name: 'fav_movies',
      desc: '',
      args: [],
    );
  }

  /// `Add To Favorite`
  String get add_to_fav {
    return Intl.message(
      'Add To Favorite',
      name: 'add_to_fav',
      desc: '',
      args: [],
    );
  }

  /// `Movie Details`
  String get movie_details {
    return Intl.message(
      'Movie Details',
      name: 'movie_details',
      desc: '',
      args: [],
    );
  }

  /// `Upcoming Movies`
  String get upcoming_movies {
    return Intl.message(
      'Upcoming Movies',
      name: 'upcoming_movies',
      desc: '',
      args: [],
    );
  }

  /// `Delete`
  String get delete {
    return Intl.message(
      'Delete',
      name: 'delete',
      desc: '',
      args: [],
    );
  }

  /// `removed from the list!`
  String get removed_from {
    return Intl.message(
      'removed from the list!',
      name: 'removed_from',
      desc: '',
      args: [],
    );
  }

  /// `added the list!`
  String get added_to {
    return Intl.message(
      'added the list!',
      name: 'added_to',
      desc: '',
      args: [],
    );
  }

  /// `List is empty!`
  String get list_empty {
    return Intl.message(
      'List is empty!',
      name: 'list_empty',
      desc: '',
      args: [],
    );
  }

  /// `Share`
  String get share {
    return Intl.message(
      'Share',
      name: 'share',
      desc: '',
      args: [],
    );
  }

  /// `Shared`
  String get shared {
    return Intl.message(
      'Shared',
      name: 'shared',
      desc: '',
      args: [],
    );
  }

  /// `Go to website`
  String get go_to_web {
    return Intl.message(
      'Go to website',
      name: 'go_to_web',
      desc: '',
      args: [],
    );
  }

  /// `Could not launch`
  String get cant_launch {
    return Intl.message(
      'Could not launch',
      name: 'cant_launch',
      desc: '',
      args: [],
    );
  }
}

class AppLocalizationDelegate extends LocalizationsDelegate<S> {
  const AppLocalizationDelegate();

  List<Locale> get supportedLocales {
    return const <Locale>[
      Locale.fromSubtags(languageCode: 'en'),
    ];
  }

  @override
  bool isSupported(Locale locale) => _isSupported(locale);
  @override
  Future<S> load(Locale locale) => S.load(locale);
  @override
  bool shouldReload(AppLocalizationDelegate old) => false;

  bool _isSupported(Locale locale) {
    for (var supportedLocale in supportedLocales) {
      if (supportedLocale.languageCode == locale.languageCode) {
        return true;
      }
    }
    return false;
  }
}
