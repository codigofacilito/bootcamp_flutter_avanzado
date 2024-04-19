import 'package:arquitectura_limpia/domain/entity/character.dart';

import '../../domain/repository/character_repository.dart';
import '../source/characters_remote_data_source.dart';

/*En repositorios implementaremos las acciones que definimos en la capa de dominio y aqui vamos a
* dar funcionalidad conectandonos con el api y realizando lo que corresponde en este caso consultar*/
class CharacterRepositoryImpl implements CharterRepository{
  final CharacterRemoteDataSourceImpl _characterRemoteDataSourceImpl;

  CharacterRepositoryImpl({required CharacterRemoteDataSourceImpl
  characterRemoteDataSourceImpl}):_characterRemoteDataSourceImpl = characterRemoteDataSourceImpl;
  @override
  Future<List<Character>> getCharacters({int page = 0}) async{
    // TODO: implement getCharacters
    final fetchList = await _characterRemoteDataSourceImpl.loadCharacter(page: page);
    return fetchList;
  }

}