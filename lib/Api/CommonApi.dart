


import 'dart:convert';

import 'package:dream11_pw/Constant/api_url.dart';
import 'package:http/http.dart'as http;
import 'package:shared_preferences/shared_preferences.dart';
 var privacyPolicy;
 var ABOUTUSS;
 var tandc;
 var Leagality;
 var wcp;
 var refund_p;
 var H_t_P;
class Commanapi{
  static void PPolicy() async {
    final url = Uri.parse(ApiUrl.privacy);
    final headers = {
      "Content-Type": "application/json",
    };
    final data = {
    //  "user_id": userid,
    };

    final response = await http.post(
        url,
        headers: headers,
        body: json.encode(data)
    );
    if(response.statusCode==200){
      final responseData = jsonDecode(response.body)["data"][0];
      privacyPolicy = responseData["content"];
    }else{
      throw Exception("failed to load data");
    }
  }
  static void about_us() async {
    final url = Uri.parse(ApiUrl.aboutUs);
    final headers = {
      "Content-Type": "application/json",
    };
    final data = {
      //  "user_id": userid,
    };

    final response = await http.post(
        url,
        headers: headers,
        body: json.encode(data)
    );
    if(response.statusCode==200){
      final responseData = jsonDecode(response.body)["data"][0];
    ABOUTUSS = responseData["content"];
    }else{
      throw Exception("failed to load data");
    }
  }
  static void Term() async {
    final url = Uri.parse(ApiUrl.termsConditions);
    final headers = {
      "Content-Type": "application/json",
    };
    final data = {
      //  "user_id": userid,
    };

    final response = await http.post(
        url,
        headers: headers,
        body: json.encode(data)
    );
    if(response.statusCode==200){
      final responseData = jsonDecode(response.body)["data"][0];
      tandc = responseData["content"];
    }else{
      throw Exception("failed to load data");
    }
  }
  static void legal() async {
    final url = Uri.parse(ApiUrl.legality);
    final headers = {
      "Content-Type": "application/json",
    };
    final data = {
      //  "user_id": userid,
    };

    final response = await http.post(
        url,
        headers: headers,
        body: json.encode(data)
    );
    if(response.statusCode==200){
      final responseData = jsonDecode(response.body)["data"][0];
      Leagality = responseData["content"];
    }else{
      throw Exception("failed to load data");
    }
  }
  static void Withdrawlcpolicy() async {
    final url = Uri.parse(ApiUrl.withdrawCash);
    final headers = {
      "Content-Type": "application/json",
    };
    final data = {
      //  "user_id": userid,
    };

    final response = await http.post(
        url,
        headers: headers,
        body: json.encode(data)
    );
    if(response.statusCode==200){
      final responseData = jsonDecode(response.body)["data"][0];
      wcp = responseData["content"];
    }else{
      throw Exception("failed to load data");
    }
  }
  static void refund() async {
    final url = Uri.parse(ApiUrl.refundPolicy);
    final headers = {
      "Content-Type": "application/json",
    };
    final data = {
      //  "user_id": userid,
    };

    final response = await http.post(
        url,
        headers: headers,
        body: json.encode(data)
    );
    if(response.statusCode==200){
      final responseData = jsonDecode(response.body)["data"][0];
      refund_p = responseData["content"];
    }else{
      throw Exception("failed to load data");
    }
  }
  static void HOWTOPLAY() async {
    final url = Uri.parse(ApiUrl.howToPlay);
    final headers = {
      "Content-Type": "application/json",
    };
    final data = {
      //  "user_id": userid,
    };

    final response = await http.post(
        url,
        headers: headers,
        body: json.encode(data)
    );
    if(response.statusCode==200){
      final responseData = jsonDecode(response.body)["data"][0];
      H_t_P = responseData["content"];
    }else{
      throw Exception("failed to load data");
    }
  }
}