// // ignore_for_file: depend_on_referenced_packages
//
// import 'dart:convert';
//
// import 'package:http/http.dart'as http;
// import 'package:shared_preferences/shared_preferences.dart';
// import 'package:dream11_pw/Constant/api_url.dart';
//
// var username;
// var email;
// var contact;
// var dob;
// var gender;
// var country;
// var state;
// var city;
// var image;
// var referral_code;
// Future<void> getprofile() async {
//   final prefs = await SharedPreferences.getInstance();
//   final userid = prefs.getString("userid");
//
//   final url = Uri.parse(ApiUrl.profile);
//   final headers = {
//     "Content-Type": "application/json",
//   };
//   final data = {
//     "user_id": userid,
//   };
//
//   final response = await http.post(
//       url,
//       headers: headers,
//       body: json.encode(data)
//   );
//   if(response.statusCode==200){
//     final responseData = jsonDecode(response.body)["data"];
//
//     username = responseData["name"];
//     email = responseData["email"];
//     contact = responseData["mobile"];
//     dob = responseData["dob"];
//     gender = responseData["gender"];
//     country = responseData["country"];
//     state = responseData["state"];
//     city = responseData["city"];
//     image=responseData["image"];
//     referral_code=responseData["referral_code"];
//   }else{
//     throw Exception("failed to load data");
//   }
// }