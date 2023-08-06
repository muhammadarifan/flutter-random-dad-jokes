import 'package:flutter/material.dart';
import 'package:random_dad_jokes/app/app.dart';
import 'package:random_dad_jokes/bootstrap.dart';
import 'package:random_dad_jokes/di/injection.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  configureInjection(production);
  bootstrap(() => const App());
}
