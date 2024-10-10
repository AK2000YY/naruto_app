import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:naruto_app/data/model/character.dart';

class AllCharactersRepository {

  final http.Client httpClient;

  AllCharactersRepository(this.httpClient);

  Future<List<Character>> getCharacters(int page) async {
    final response = await httpClient.get(
      Uri.https(
        'narutodb.xyz',
        '/api/character',
        <String,String>{"page":'$page', 'limit':'10'}
      )
    );

    if (response.statusCode == 200) {
      final Map<String, dynamic> body = json.decode(response.body);
      final List<dynamic> charactersJson = body['characters'];
      return charactersJson.map((characterJson) {
        final map = characterJson as Map<String, dynamic>;
        return Character.fromJson(map);
      }).toList();
    }

    throw Exception("connection failed!");
  }
}