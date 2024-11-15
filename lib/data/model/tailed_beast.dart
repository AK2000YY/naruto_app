// Copyright © AK2000YY, 2024. All rights reserved.
// Unauthorized copying of this file, via any medium, is strictly prohibited

import 'package:naruto_app/data/model/personal.dart';

import '../../core/function/pars_data.dart';
import 'Family.dart';
import 'debut.dart';

class TailedBeast {
  int? id;
  String? name;
  List<String>? images;
  dynamic debut;
  dynamic personal;
  dynamic family;
  dynamic jutsu;
  dynamic natureType;

  TailedBeast({this.id, this.name, this.images, this.debut, this.personal, this.family, this.jutsu, this.natureType});

  factory TailedBeast.fromJson(Map<String, dynamic>? json) {
    return TailedBeast(
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

  TailedBeast.fromMap(Map<String, Object?> map) {
    id = map["id"] as int?;
    name = map["name"] as String;
  }

}