import 'dart:convert';

import 'package:http/http.dart'as http;
import 'package:shared_preferences/shared_preferences.dart';
import 'package:dream11_pw/Constant/api_url.dart';

var winning_amount;
var aadhar_status;
var pan_status;
var total_amount;
var credit_amount;
var bonous_amount;
var credit_note;
var bonous_note;
var winning_note;
var total_withdraw;

Future<void> getwallet() async {
  final prefs = await SharedPreferences.getInstance();
  final userid = prefs.getString("userid");
  final url = Uri.parse(ApiUrl.wallet);
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
    winning_amount = responseData["winning_amount"];
    aadhar_status = responseData["aadhar_status"];
    pan_status = responseData["pan_status"];
    total_amount = responseData["total_amount"];
    credit_amount = responseData["credit_amount"];
    bonous_amount = responseData["bonous_amount"];
    winning_note = responseData["winning_note"];
    total_withdraw = responseData["total_withdraw"];



  }else{
    throw Exception("failed to load data");
  }
}