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
}