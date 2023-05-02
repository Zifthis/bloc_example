import 'package:bloc_example/app/app.dart';
import 'package:bloc_example/bootstrap.dart';
import 'package:bloc_example/core/data/api_service.dart';
import 'package:flutter/material.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  ApiService.register();
  bootstrap(() => const App());
}
