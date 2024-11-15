// Copyright © AK2000YY, 2024. All rights reserved.
// Unauthorized copying of this file, via any medium, is strictly prohibited

import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:naruto_app/data/model/village.dart';

class AllVillagesRepository {

  final http.Client httpClient;

  AllVillagesRepository(this.httpClient);

  Future<List<Village>> getVillages(int page) async {
    final response = await httpClient.get(
        Uri.https(
            'narutodb.xyz',
            '/api/village',
            <String,String>{"page":'$page', 'limit':'10'}
        )
    );

    if (response.statusCode == 200) {
      final Map<String, dynamic> body = json.decode(response.body);
      final List<dynamic> villagesJson = body['villages'];
      return villagesJson.map((villageJson) {
        final map = villageJson as Map<String, dynamic>;
        return Village.fromJson(map);
      }).toList();
    }

    throw Exception("connection failed!");
  }
}