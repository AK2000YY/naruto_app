// Copyright © AK2000YY, 2024. All rights reserved.
// Unauthorized copying of this file, via any medium, is strictly prohibited

import 'character.dart';

class Village {
  int? id;
  String? name;
  List<Character>? characters;

  Village({this.id, this.name, this.characters});

  factory Village.fromJson(Map<String, dynamic>? json) {
    return Village(
      id: json?['id'] as int?,
      name: json?['name'] as String?,
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

  Village.fromMap(Map<String, Object?> map) {
    id = map["id"] as int?;
    name = map["name"] as String;
  }
}