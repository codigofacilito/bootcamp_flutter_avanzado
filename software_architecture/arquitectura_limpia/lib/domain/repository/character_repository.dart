import 'package:arquitectura_limpia/domain/entity/character.dart';
/*Creamos clases abstractas donde especificamos las acciones que haremos por ejemplo:
Consultar, Crear, Actualizar, eliminar, etc.
*/
abstract class CharterRepository{
  Future<List<Character>> getCharacters({int page=0});
}