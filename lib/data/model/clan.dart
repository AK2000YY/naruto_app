import 'package:naruto_app/data/model/character.dart';

class Clan {
  int? id;
  String? name;
  List<String>? images;
  List<Character>? characters;

  Clan({this.id, this.name, this.images, this.characters});

  factory Clan.fromJson(Map<String, dynamic>? json) {
    return Clan(
      id: json?['id'] as int?,
      name: json?['name'] as String?,
      images: List<String>.from(json?['images']),
      characters: (json?['characters'] as List<dynamic>?)
          ?.map((characterJson) => Character.fromJson(characterJson))
          .toList(),
    );
  }

  Map<String, Object?> toMap() {
    return {
      "id": id,
      "name": name
    };
  }

  Clan.fromMap(Map<String, Object?> map) {
    id = map["id"] as int?;
    name = map["name"] as String;
  }
}