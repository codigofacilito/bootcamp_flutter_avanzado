import 'package:arquitectura_limpia/domain/usecase/get_all_chatracters.dart';
import 'package:flutter/cupertino.dart';

import '../../../../app/injection_container.dart';
import '../../../../domain/entity/character.dart';

//Creamos los estatus para saber que pasa al obtener los datos
enum CharacterPageStatus { initial, loading, success, failed }

class CharacterPageChangeNotifier extends ChangeNotifier {
  //Recibimos el useCase con la accion especifica
  final GetAllCharacters _getAllCharacters;

  //Recibimos e inicializamos nuestros datos que usaremos
  CharacterPageChangeNotifier()
      : _getAllCharacters = sl.get<GetAllCharacters>(),
        _status = CharacterPageStatus.initial,
        _currentPage = 1,
        _characters = [];

  //Agregaremos la lista de personajes
  final List<Character> _characters;
  List<Character> get characters => List.of(_characters);

  //Manejaremos el estatus de que es lo que esta pasando mientras se optienen los datos
  CharacterPageStatus _status;
  CharacterPageStatus get status => _status;

  //Paginado para ir consultando todos los datos.
  int _currentPage;
  int get currentPage => _currentPage;

  var _hasReachedEnd = false;
  bool get hasReachedEnd => _hasReachedEnd;

  Future<void> fetchNextPage() async {
    if(_hasReachedEnd) return;

    _status = CharacterPageStatus.loading;
    notifyListeners();
    final list = await _getAllCharacters(page: _currentPage);
    _currentPage++;
    _characters.addAll(list);
    _status = CharacterPageStatus.success;
    _hasReachedEnd = list.isEmpty;
    notifyListeners();
  }
}
