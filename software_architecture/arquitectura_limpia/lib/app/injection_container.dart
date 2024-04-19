
import 'package:arquitectura_limpia/domain/usecase/get_all_chatracters.dart';
import 'package:get_it/get_it.dart';

import '../data/repositories/character_repository_impl.dart';
import '../data/source/characters_remote_data_source.dart';
import '../data/source/network/api.dart';
import '../domain/repository/character_repository.dart';

final sl = GetIt.instance;

Future<void>init() async {
  sl.registerLazySingleton<Api>(() => Api());
  sl.registerLazySingleton<CharacterRemoteDataSourceImpl>(() => CharacterRemoteDataSourceImpl(sl()));
  sl.registerLazySingleton<CharterRepository>(() => CharacterRepositoryImpl(characterRemoteDataSourceImpl: sl() ));
  sl.registerLazySingleton<GetAllCharacters>(() => GetAllCharacters(repository: sl()));

}