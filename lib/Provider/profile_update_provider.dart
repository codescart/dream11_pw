// ignore_for_file: depend_on_referenced_packages

import 'dart:convert';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import '../Constant/api_url.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../Utils/utils.dart';

class UpdateUserProvider with ChangeNotifier {
  bool _loading = false;
  bool get loading => _loading;
  setLoading(bool value) {
    _loading = value;
    notifyListeners();
  }

  Future updateUser(
      String name,
      String email,
      String phone,
      String dob,
      String gender,
      String country,
      String state,
      String city,
      String image) async {
    final prefs = await SharedPreferences.getInstance();
    final userid = prefs.getString("userid");
    try {
      setLoading(true);
      final response = await http
          .post(
            Uri.parse(ApiUrl.editProfile),
            headers: {"Content-Type": "application/json"},
            body: jsonEncode({
              "user_id": '$userid',
              "name": name,
              "email": email,
              "contact": phone,
              "dob": dob,
              "gender": gender,
              "country": country,
              "state": state,
              "city": city,
              "image": image,
            }),
          )
          .timeout(const Duration(seconds: 10));
      if (response.statusCode == 200) {
        final Map<String, dynamic> responseData = jsonDecode(response.body);
        setLoading(false);
        return Utils.showToast(responseData['msg']);
      } else {
        setLoading(false);
        final Map<String, dynamic> responseData = jsonDecode(response.body);
        return Utils.showToast(responseData['msg']);
      }
    } catch (e) {
      throw Exception('No Internet connection');
    }
  }
}
