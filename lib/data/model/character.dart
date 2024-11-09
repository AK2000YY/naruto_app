import 'package:naruto_app/data/model/Family.dart';
import 'package:naruto_app/data/model/debut.dart';
import 'package:naruto_app/data/model/personal.dart';
import 'package:naruto_app/core/function/pars_data.dart';

class Character {
  int? id;
  String? name;
  List<String>? images;
  dynamic debut;
  dynamic personal;
  dynamic family;
  dynamic jutsu;
  dynamic natureType;

  Character({this.id, this.name, this.images, this.debut, this.personal, this.family, this.jutsu, this.natureType});

  factory Character.fromJson(Map<String, dynamic>? json) {
    return Character(
      id: json?['id'] as int?,
      name: json?['name'] as String?,
      images: List<String>.from(json?['images'] ?? []),
      debut: parseData<Debut>(json?['debut'], (data) => Debut.fromJson(data)),
      personal: parseData<Personal>(json?['personal'], (data) => Personal.fromJson(data)),
      family: parseData<Family>(json?['family'], (data) => Family.fromJson(data)),
      jutsu: List<String>.from(json?['jutsu'] ?? []),
      natureType: List<String>.from(json?['natureType'] ?? []),
    );
  }

  Map<String, Object?> toMap() {
    return {
      "id": id,
      "name": name
    };
  }

  Character.fromMap(Map<String, Object?> map) {
    id = map["id"] as int?;
    name = map["name"] as String;
  }

}

