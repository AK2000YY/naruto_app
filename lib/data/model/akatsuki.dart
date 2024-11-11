import 'package:naruto_app/data/model/personal.dart';

import '../../core/function/pars_data.dart';
import 'Family.dart';
import 'debut.dart';

class Akatsuki {
  int? id;
  String? name;
  List<String>? images;
  dynamic debut;
  dynamic personal;
  dynamic family;
  dynamic jutsu;
  dynamic natureType;

  Akatsuki({this.id, this.name, this.images, this.debut, this.personal, this.family, this.jutsu, this.natureType});

  factory Akatsuki.fromJson(Map<String, dynamic>? json) {
    return Akatsuki(
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

  Akatsuki.fromMap(Map<String, Object?> map) {
    id = map["id"] as int?;
    name = map["name"] as String;
  }
}