// Copyright © AK2000YY, 2024. All rights reserved.
// Unauthorized copying of this file, via any medium, is strictly prohibited

import 'dart:convert';

import 'package:http/http.dart' as http;

import '../model/clan.dart';

class AllClansRepository {

  final http.Client httpClient;

  AllClansRepository(this.httpClient);

  Future<List<Clan>> getClans(int page) async {
    final response = await httpClient.get(
      Uri.https(
          'narutodb.xyz',
          '/api/clan',
          <String,String>{"page":'$page', 'limit':'10'}
      )
    );

    if(response.statusCode == 200) {
      final Map<String, dynamic> body = json.decode(response.body);
      final List<dynamic> clansJson = body['clans'];
      return clansJson.map((clanJson) {
        final map = clanJson as Map<String, dynamic>;
        return Clan.fromJson(map);
      }).toList();
    }

    throw Exception("connection failed!");
  }
}