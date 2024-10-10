import 'package:naruto_app/data/model/Family.dart';
import 'package:naruto_app/data/model/debut.dart';
import 'package:naruto_app/data/model/personal.dart';

class Character {
  int? id;
  String? name;
  List<String>? images;
  Debut? debut;
  Personal? personal;
  Family? family;
  List<String>? jutsu;
  List<String>? natureType;

  Character({this.id, this.name, this.images, this.debut, this.personal, this.family, this.jutsu, this.natureType});

  factory Character.fromJson(Map<String, dynamic>? json) {
    return Character(
      id: json?['id'] as int?,
      name: json?['name'] as String?,
      images: List<String>.from(json?['images'] ?? []),
      debut: Debut.fromJson(json?['debut']),
      personal: Personal.fromJson(json?['personal']),
      family: Family.fromJson(json?['family']),
      jutsu: List<String>.from(json?['jutsu'] ?? []),
      natureType: List<String>.from(json?['natureType'] ?? []),
    );
  }

}