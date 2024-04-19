import 'package:arquitectura_limpia/domain/entity/character.dart';
import '../repository/character_repository.dart';

/* En useCase Crearemos un archivo por cada accion que realizaremos y este se comunicara
con la capa de datos y presentacion.
*/

class GetAllCharacters{
  CharterRepository _repository;
  GetAllCharacters({required  CharterRepository repository}):_repository=repository;

  Future<List<Character>> call({int page=0})async{
    return await _repository.getCharacters(page: page);
  }
}