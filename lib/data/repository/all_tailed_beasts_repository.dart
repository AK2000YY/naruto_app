// Copyright © AK2000YY, 2024. All rights reserved.
// Unauthorized copying of this file, via any medium, is strictly prohibited

import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:naruto_app/data/model/tailed_beast.dart';


class AllTailedBeastsRepository {

  final http.Client httpClient;

  AllTailedBeastsRepository(this.httpClient);

  Future<List<TailedBeast>> getTailedBeasts(int page) async {
    final response = await httpClient.get(
        Uri.https(
            'narutodb.xyz',
            '/api/tailed-beast',
            <String,String>{"page":'$page', 'limit':'10'}
        )
    );

    if (response.statusCode == 200) {
      final Map<String, dynamic> body = json.decode(response.body);
      final List<dynamic> tailedBeastsJson = body['tailedBeasts'];
      return tailedBeastsJson.map((tailedBeastJson) {
        final map = tailedBeastJson as Map<String, dynamic>;
        return TailedBeast.fromJson(map);
      }).toList();
    }

    throw Exception("connection failed!");
  }
}