import 'package:autenticacion_oauth/repository/session_repo.dart';
import 'package:get_it/get_it.dart';

import 'data/remote/api.dart';

final sl = GetIt.instance;

Future<void> setupLocator()async{
  sl.registerLazySingleton<Api>(() => Api());
  sl.registerLazySingleton<SessionRepoImpl>(() => SessionRepoImpl());
}