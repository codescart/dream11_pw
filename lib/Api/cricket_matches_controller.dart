// ignore_for_file: depend_on_referenced_packages

import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import 'package:dream11_pw/Model/my_match_model.dart';
import 'dart:convert';
import '../Model/cricket_matches_model.dart';

class CricketMatchesController {

  static Future<List<CricketMatchesModel>> fetchMatches(
      String status, String url) async {
    try {
      final response = await http.post(
        Uri.parse(url),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: jsonEncode(<String, String>{"status": status}),
      );

      if (response.statusCode == 200) {
        List<dynamic> data = json.decode(response.body)['data'];

        List<CricketMatchesModel> upcomingMatches = [];

        for (var matchData in data) {
          upcomingMatches.add(CricketMatchesModel.fromJson(matchData));
        }
        return upcomingMatches;
      } else {
        if (kDebugMode) {
          print('Failed to load data');
        }
        return [];
      }
    } catch (e) {
      if (kDebugMode) {
        print('Error fetching data: $e');
      }
      return [];
    }
  }

  static Future<List<MyMatchModel>> fetchMyMatches(
      String status, String userId, String url) async {
    try {
      final response = await http.post(
        Uri.parse(url),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: jsonEncode(<String, String>{"status": status, "user_id": userId}),
      );

      if (response.statusCode == 200) {
        List<dynamic> data = json.decode(response.body)['data'];

        List<MyMatchModel> myMatchesList = [];

        for (var matchData in data) {
          myMatchesList.add(MyMatchModel.fromJson(matchData));
        }
        return myMatchesList;
      } else {
        if (kDebugMode) {
          print('Failed to load data');
        }
        return [];
      }
    } catch (e) {
      if (kDebugMode) {
        print('Error fetching data: $e');
      }
      return [];
    }
  }
}
