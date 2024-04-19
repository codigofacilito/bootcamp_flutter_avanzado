import 'package:arquitectura_limpia/domain/entity/location.dart';

//En entity creamos las clases(platillas) para manejar los datos que se nos van a enviar
class Character{
  int? id;
  String? name;
  String? status;
  String? species;
  String? type;
  String? gender;
  String? image;
  String? url;
  List<String>? episode;
  DateTime? created;
  Location? location;
  Location? origin;

  bool get isAlive => status== "Alive";
  Character({this.id,this.name,this.status,this.species,this.type,this.gender,this.location,this.origin,this.image
  ,this.episode,this.url,this.created});
}