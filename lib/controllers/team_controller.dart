import 'package:flutter/material.dart';
import 'package:mvc/models/team.dart';
import 'package:mvc/services/api/get_team.dart';

class TeamController with ChangeNotifier {
  List<Team> _teams = [];

  List<Team> get teams => _teams;

  Future fetchTeams() async {
    try {
      _teams = await ApiServices().getTeam();
      
      notifyListeners();
    } catch (e) {
      print("Failed to fetch teams: $e");
    }
    return _teams;
  }
}
