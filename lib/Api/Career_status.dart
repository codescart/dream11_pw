// ignore_for_file: depend_on_referenced_packages

import 'dart:convert';
import 'package:http/http.dart'as http;
import 'package:shared_preferences/shared_preferences.dart';
import 'package:dream11_pw/Constant/api_url.dart';

var wins;
var series;
var contest;
var matchs;

Future<void> getCareerStatus() async {
  final prefs = await SharedPreferences.getInstance();
  final userid = prefs.getString("userid");
  final url = Uri.parse(ApiUrl.careerStatus);
  final headers = {
    "Content-Type": "application/json",
  };
  final data = {
    "user_id": userid,
  };
  final response = await http.post(
      url,
      headers: headers,
      body: json.encode(data)
  );
  if(response.statusCode==200){
    final responseData = jsonDecode(response.body)["data"];


  wins = responseData["wins"];
  series = responseData["series"];
  contest = responseData["contest"];
  matchs = responseData["matchs"];

  }else{
    throw Exception("failed to load data");
  }
}