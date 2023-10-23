// ignore_for_file: depend_on_referenced_packages

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:dream11_pw/Constant/api_url.dart';
import 'package:dream11_pw/MyMatch/MyMatchWidget/my_completed_match_tab.dart';
import 'package:dream11_pw/MyMatch/MyMatchWidget/my__live_match_tab.dart';
import 'package:dream11_pw/MyMatch/MyMatchWidget/my_upcoming_match_tab.dart';
import '../Api/cricket_matches_controller.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../Model/my_match_model.dart';

class MyMatch extends StatefulWidget {
  const MyMatch({super.key});

  @override
  State<MyMatch> createState() => _MyMatchState();
}

class _MyMatchState extends State<MyMatch> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      initialIndex: 0,
      child: Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          backgroundColor: Colors.red,
          title: const Text('My Contest'),
          centerTitle: true,
          bottom: const TabBar(
            indicatorWeight: 3,
            indicatorPadding: EdgeInsets.fromLTRB(10, 0, 10, 0),
            indicatorColor: Colors.white,
            tabs: [
              Tab(text: "UpComing"),
              Tab(text: "Live"),
              Tab(text: "Completed"),
            ],
          ),
        ),
        body: TabBarView(
          children: [
            UpComingScreen(upcomingMatches),
            LiveScreen(liveMatches),
            CompletedScreen(completeMatches),
          ],
        ),
      ),
    );
  }

  List<MyMatchModel> liveMatches = [];
  List<MyMatchModel> upcomingMatches = [];
  List<MyMatchModel> completeMatches = [];

  @override
  void initState() {
    super.initState();
    fetchData();
  }


  Future<void> fetchData() async {
    final prefs = await SharedPreferences.getInstance();
    final userid = prefs.getString("userid");
    try {
      List<MyMatchModel> matchLive = await CricketMatchesController.fetchMyMatches("Live",'$userid',ApiUrl.myMatchRecord);
      List<MyMatchModel> matchFixture = await CricketMatchesController.fetchMyMatches("Fixture",'$userid',ApiUrl.myMatchRecord);
      List<MyMatchModel> matchResult = await CricketMatchesController.fetchMyMatches("Result",'$userid',ApiUrl.myMatchRecord);
      setState(() {
        liveMatches = matchLive;
        upcomingMatches = matchFixture;
        completeMatches = matchResult;
      });
    } catch (e) {
      if (kDebugMode) {
        print('Error fetching upcoming matches: $e');
      }
    }
  }
}
