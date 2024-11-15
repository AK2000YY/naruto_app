// Copyright © AK2000YY, 2024. All rights reserved.
// Unauthorized copying of this file, via any medium, is strictly prohibited

import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:naruto_app/data/model/akatsuki.dart';

class AllAkatsukiRepository {

  final http.Client httpClient;

  AllAkatsukiRepository(this.httpClient);

  Future<List<Akatsuki>> getAkatsuki(int page) async {
    final response = await httpClient.get(
        Uri.https(
            'narutodb.xyz',
            '/api/akatsuki',
            <String,String>{"page":'$page', 'limit':'10'}
        )
    );

    if (response.statusCode == 200) {
      final Map<String, dynamic> body = json.decode(response.body);
      final List<dynamic> akatsukiJson = body['akatsuki'];
      return akatsukiJson.map((akatsukiJson) {
        final map = akatsukiJson as Map<String, dynamic>;
        return Akatsuki.fromJson(map);
      }).toList();
    }

    throw Exception("connection failed!");
  }

}