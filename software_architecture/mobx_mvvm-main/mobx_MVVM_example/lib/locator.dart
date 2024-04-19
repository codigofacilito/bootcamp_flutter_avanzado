import 'package:get_it/get_it.dart';
import 'package:mobx_mvvm_example/repository/post_repo.dart';

import 'data/network/api.dart';

final sl = GetIt.instance;

Future<void> setupLocator()async{
  sl.registerLazySingleton<Api>(() => Api());
  sl.registerLazySingleton<PostRepoImpl>(() => PostRepoImpl());
}