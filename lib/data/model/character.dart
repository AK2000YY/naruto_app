import 'package:naruto_app/data/model/Family.dart';
import 'package:naruto_app/data/model/debut.dart';
import 'package:naruto_app/data/model/personal.dart';

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
      debut: _parseDebut(json?['debut']),
      personal: _parsePersonal(json?['personal']),
      family: _parseFamily(json?['family']),
      jutsu: List<String>.from(json?['jutsu'] ?? []),
      natureType: List<String>.from(json?['natureType'] ?? []),
    );
  }

}


dynamic _parseDebut(dynamic data) {
  if (data == null) return null;
  if (data is Map<String, dynamic>) return Debut.fromJson(data);
  if (data is List) return List<String>.from(data);
  if (data is String) return data;
}

dynamic _parsePersonal(dynamic data) {
  if (data == null) return null;
  if (data is Map<String, dynamic>) return Personal.fromJson(data);
  if (data is List) return List<String>.from(data);
  if (data is String) return data;
}

dynamic _parseFamily(dynamic data) {
  if (data == null) return null;
  if (data is Map<String, dynamic>) return Family.fromJson(data);
  if (data is List) return List<String>.from(data);
  if (data is String) return data;
}