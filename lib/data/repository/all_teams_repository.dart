import 'dart:convert';

import 'package:http/http.dart' as http;

import '../model/team.dart';

class AllTeamsRepository {

  final http.Client httpClient;

  AllTeamsRepository(this.httpClient);

  Future<List<Team>> getTeams(int page) async {
    final response = await httpClient.get(
        Uri.https(
            'narutodb.xyz',
            '/api/team',
            <String,String>{"page":'$page', 'limit':'10'}
        )
    );

    if (response.statusCode == 200) {
      final Map<String, dynamic> body = json.decode(response.body);
      final List<dynamic> teamsJson = body['characters'];
      return teamsJson.map((teamJson) {
        final map = teamJson as Map<String, dynamic>;
        return Team.fromJson(map);
      }).toList();
    }

    throw Exception("connection failed!");
  }

}