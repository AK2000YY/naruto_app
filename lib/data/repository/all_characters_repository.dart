import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:naruto_app/data/model/Family.dart';
import 'package:naruto_app/data/model/character.dart';
import 'package:naruto_app/data/model/debut.dart';
import 'package:naruto_app/data/model/personal.dart';

class AllCharactersRepository {

  final http.Client httpClient;

  AllCharactersRepository(this.httpClient);

  Future<List<Character>> getCharacters(int page) async {
    final response = await httpClient.get(
      Uri.https(
        'narutodb.xyz/api',
        '/character',
        <String,String>{"page":'$page', 'limit':'6'}
      )
    );

    if(response.statusCode == 200){
      final body = json.decode(response.body) as List;
      return body.map((dynamic json) {
        final map = json as Map<String,dynamic>;
        return Character(
            id: map['id'] as int,
            name: map['name'] as String,
            images: map['images'] as List<String>,
            debut: map['debut'] as Debut,
            personal: map['personal'] as Personal,
            family: map['family'] as Family,
            jutsu: map['family'] as List<String>,
            natureType: map['natureType'] as List<String>
        );
      }).toList();
    }

    throw Exception("connection failed!");
  }
}