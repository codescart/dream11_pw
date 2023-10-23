import 'dart:convert';

import 'package:dream11_pw/Constant/api_url.dart';
import 'package:http/http.dart'as http;
import 'package:shared_preferences/shared_preferences.dart';

 var ifsc_code;
 var bank_name;
 var holders_name;
 var aadhar;
 var status;
 var Acno;


class  Kyc{
  static void Bankdetails() async {
    final prefs = await SharedPreferences.getInstance();
    final userid = prefs.getString("userid");
    final url = Uri.parse(ApiUrl.bankKycView);
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
      ifsc_code = responseData["ifsc_code"];
      bank_name = responseData["bank_name"];
      holders_name = responseData["holders_name"];
      Acno = responseData["acc_no"];
      aadhar = responseData["aadhar"];
      status = responseData["status"];


    }else{
      throw Exception("failed to load data");
    }
  }
}