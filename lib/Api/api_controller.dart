// ignore_for_file: depend_on_referenced_packages

import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:dream11_pw/Model/contest_model.dart';
import 'package:dream11_pw/Model/cricket_matches_model.dart';
import '../Constant/api_url.dart';
import '../Home/HomeWidget/CricketTabs/cricket_tabs.dart';
import '../Model/join_contest_model.dart';
import '../Model/my_join_contest_list_live_model.dart';
import '../Model/view_profile_model.dart';
import '../Provider/view_profile_provider.dart';
import '../Utils/utils.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ApiController {
  ProfileViewProvider profileViewProvider = ProfileViewProvider();
  // final userData = Provider.of<ProfileViewProvider>(context).userData;
  //get join contest
  static Future<List<JoinContestModel>> fetchJoinContest(
      String matchId, String userId) async {
    try {
      final response = await http.post(
        Uri.parse(ApiUrl.myJoinContestList),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: jsonEncode(
            <String, String>{"user_id": userId, "match_id": matchId}),
      );

      if (response.statusCode == 200) {
        List<dynamic> data = json.decode(response.body)['data'];

        List<JoinContestModel> joinContestList = [];

        for (var matchData in data) {
          joinContestList.add(JoinContestModel.fromJson(matchData));
        }
        return joinContestList;
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

  //get my join contest live
  static Future<List<MyJoinContestListLiveModel>> fetchMyJoinLiveContest(
      String matchId, String userId) async {
    try {
      final response = await http.post(
        Uri.parse(ApiUrl.myJoinContestListLive),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: jsonEncode(
            <String, String>{"match_id": matchId, "user_id": userId}),
      );

      if (response.statusCode == 200) {
        List<dynamic> data = json.decode(response.body)['data'];

        List<MyJoinContestListLiveModel> myMatchesList = [];

        for (var matchData in data) {
          myMatchesList.add(MyJoinContestListLiveModel.fromJson(matchData));
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

  //join contest
  static Future joinContest(
      context,
      ContestModel contestModel,
      CricketMatchesModel data,
      String teamId,
      String referralCode,
      String image) async {
    final prefs = await SharedPreferences.getInstance();
    final userid = prefs.getString("userid");
    final res = await http.post(Uri.parse(ApiUrl.joinContest),
        headers: <String, String>{
          'content-Type': 'application/json; charset=UTF-8',
        },
        body: jsonEncode(<String, String>{
          "user_id": userid.toString(),
          "my_team_id": teamId.toString(),
          "name": contestModel.contestName.toString(),
          "contest_amount": contestModel.entry.toString(),
          "match_id": contestModel.matchId.toString(),
          "TeamName": referralCode,
          "image": image,
          "contest_id": contestModel.contestId.toString()
        }));
    final response = jsonDecode(res.body);
    if (res.statusCode == 200) {
      if (response['status'] == 'success') {
        Navigator.pushReplacement(
            context,
            MaterialPageRoute(
                builder: (context) => CricketTabs(data: data, tabIndex: 1)));
        return Utils.showToast(response['message'].toString());
      } else {
        return Utils.showToast(response['message'].toString());
      }
    } else {
      throw Exception('Server error');
    }
  }

  //get user profile
  Future<ViewProfileModel?> fetchProfileData() async {
    final prefs = await SharedPreferences.getInstance();
    final userid = prefs.getString("userid");
    try {
      final response = await http
          .post(
            Uri.parse(ApiUrl.profile),
            headers: <String, String>{
              'Content-Type': 'application/json; charset=UTF-8',
            },
            body: jsonEncode(<String, String>{"user_id": '$userid'}),
          )
          .timeout(const Duration(seconds: 10));
      if (response.statusCode == 200) {
        final jsonMap = json.decode(response.body)['data'];
        return ViewProfileModel.fromJson(jsonMap);
      } else {
        throw Exception('Failed to load user data');
      }
    } catch (e) {
      if (kDebugMode) {
        print(e.toString());
      }
      throw Exception('No Internet connection');
    }
  }
}
