import 'package:arquitectura_limpia/data/dto/character_dto.dart';

import 'network/api.dart';

abstract class CharacterRemoteDataSource {
  Future<List<CharacterDto>> loadCharacter({int page = 0});
}

/*Aqui vamos a ejeucta nuestros enpoint especifico para poder realizar las acciones en
 en el servidor*/
class CharacterRemoteDataSourceImpl implements CharacterRemoteDataSource {
  Api api;

  CharacterRemoteDataSourceImpl(this.api);

  @override
  Future<List<CharacterDto>> loadCharacter({int page = 0}) async {
    // TODO: implement loadCharacter
    Map<String, dynamic> jsonResponse = await api.get("character/?page=$page");
    return (jsonResponse["results"] as List)
        .map((characterMap) => CharacterDto.toObject(characterMap))
        .toList();
  }
}
