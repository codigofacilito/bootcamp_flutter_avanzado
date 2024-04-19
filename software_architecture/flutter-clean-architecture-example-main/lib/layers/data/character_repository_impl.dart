
import 'package:rickmorty/layers/data/source/network/api.dart';
import 'package:rickmorty/layers/domain/entity/character.dart';
import 'package:rickmorty/layers/domain/repository/character_repository.dart';

class CharacterRepositoryImpl implements CharacterRepository {
  final Api _api;

  CharacterRepositoryImpl({
    required Api api,
  })  : _api = api;

  @override
  Future<List<Character>> getCharacters({int page = 0}) async {
    final fetchedList = await _api.loadCharacters(page: page);
    return fetchedList;
  }
}
