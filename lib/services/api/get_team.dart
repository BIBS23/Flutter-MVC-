import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as https;
import 'package:mvc/models/team.dart';
import 'package:mvc/services/end_points.dart';

class ApiServices {
  Future<List<Team>> getTeam() async {
    String url = teamUrl;
    final response = await https.get(
      Uri.parse(url),
      headers: {'Authorization': '894f7b61-0205-4127-b076-8dd2005bb939'},
    );

    if (response.statusCode == 200) {
      var jsonResponse = jsonDecode(response.body);
      
      return List<Team>.from(
        jsonResponse['data'].map(
          (model) => Team.fromJson(model),
        ),
      );
    } else {
      debugPrint(url);
      return throw Exception(
          'Request failed with status: ${response.statusCode}');
    }
  }
}


