import 'package:arquitectura_limpia/data/dto/location_dto.dart';
import 'package:arquitectura_limpia/domain/entity/character.dart';

/*La clase DTO nos servira para poder convertir los datos del servidor que vienen
en formato Map a Objeto */
class CharacterDto extends Character{
  CharacterDto({
    super.id,
    super.name,
    super.status,
    super.species,
    super.type,
    super.gender,
    super.origin,
    super.location,
    super.image,
    super.episode,
    super.url,
    super.created
});

  factory CharacterDto.toObject(Map<String,dynamic>json){
    return CharacterDto(
      id:json["id"],
      name: json["name"],
      status: json["status"],
      species: json["species"],
      type: json["type"],
      gender: json["gender"],
      origin: LocationDto.toObject(json["origin"]),
      location: LocationDto.toObject(json["location"]),
      image: json["image"],
      episode: List<String>.from(json["episode"]),
      url: json["url"],
      created: DateTime.parse(json["created"])
    );
  }

  Map<String,dynamic>toMap()=>{
    'id': id,
    'name': name,
    'status': status,
    'species': species,
    'type': type,
    'gender': gender,
    'origin': origin != null ? LocationDto.fromLocation(origin!).toMap() : null,
    'location': location != null? LocationDto.fromLocation(location!).toMap() : null,
    'image': image,
    'episode':
    episode == null ? [] : List<dynamic>.from(episode!.map((x) => x)),
    'url': url,
    'created': created?.toIso8601String(),
  };
}