import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:rickmorty/layers/presentation/app_root.dart';
import 'package:rickmorty/layers/presentation/using_get_it/injector.dart';
import 'package:shared_preferences/shared_preferences.dart';

enum StateManagementOptions {
  bloc,
  cubit,
  provider,
  riverpod,
  getIt,
  mobX,
}

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initializeGetIt();
  Animate.restartOnHotReload = true;

  runApp(const ProviderScope(child: AppRoot()));
}
