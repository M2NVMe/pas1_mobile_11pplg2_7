import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:pas1_mobile_11pplg2_7/Apis/Models/LeagueModel.dart';

class Sportsdbapi {
  final String baseUrl = "https://www.thesportsdb.com";

  Future<List<League>> fetchPosts() async {
    final response = await http.get(Uri.parse('$baseUrl/api/v1/json/3/search_all_teams.php?l=English%20Premier%20League'));

    if (response.statusCode == 200) {
      final data = json.decode(response.body) as Map<String, dynamic>;
      final leagues = data['teams'] as List<dynamic>;
      return leagues.map((json) => League.fromJson(json)).toList();
    } else {
      throw Exception('Failed to load leagues');
    }
  }
}
