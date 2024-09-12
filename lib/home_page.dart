import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:nba_app_data_api/model/team.dart';

class HomePage extends StatelessWidget {
  HomePage({super.key});

//read data from 
  List<Team> teams = [];

  Future getTeams() async {
    var response = await http.get(
      Uri.https('api.balldontlie.io', 'v1/teams'),
      headers: {
        'Authorization': 'paste your Api Key',
      },
    );

    var jsonData = jsonDecode(response.body);

    for (var eachTeam in jsonData['data']) {
      final team = Team(
        abbreviation: eachTeam['abbreviation'],
        city: eachTeam['city'],
      );
      teams.add(team);
    }
    print(teams.length);
  }

  @override
  Widget build(BuildContext context) {
    getTeams();
    return Scaffold(
      
    );
  }
}
