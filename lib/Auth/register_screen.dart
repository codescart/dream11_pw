// ignore_for_file: depend_on_referenced_packages, use_build_context_synchronously

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:dream11_pw/Constant/Button/rectangleButton.dart';
import 'package:dream11_pw/Constant/api_url.dart';
import 'package:dream11_pw/Auth/otp_screen.dart';
import 'package:dream11_pw/generated/assets.dart';
import 'package:http/http.dart' as http;
import '../Utils/utils.dart';

class RegisterPage extends StatefulWidget {
  final String phone;
  const RegisterPage({super.key, required this.phone});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  InputDecoration getInputDecoration(String hintText, IconData iconData) {
    return InputDecoration(
      counter: const Offstage(),
      enabledBorder: const OutlineInputBorder(
        borderRadius: BorderRadius.all(Radius.circular(12.0)),
        borderSide: BorderSide(color: Colors.white, width: 2),
      ),
      focusedBorder: const OutlineInputBorder(
        borderRadius: BorderRadius.all(Radius.circular(12.0)),
        borderSide: BorderSide(color: Colors.white, width: 2),
      ),
      border: const OutlineInputBorder(
        borderSide: BorderSide(color: Colors.white),
        borderRadius: BorderRadius.all(
          Radius.circular(12.0),
        ),
      ),
      focusedErrorBorder: const OutlineInputBorder(
        borderRadius: BorderRadius.all(Radius.circular(12.0)),
        borderSide: BorderSide(color: Color(0xFFF65054)),
      ),
      errorBorder: const OutlineInputBorder(
        borderRadius: BorderRadius.all(Radius.circular(12.0)),
        borderSide: BorderSide(color: Color(0xFFF65054)),
      ),
      filled: true,
      prefixIcon: Icon(
        iconData,
      ),
      hintStyle: const TextStyle(color: Colors.black54, fontSize: 14),
      hintText: hintText,
      contentPadding: const EdgeInsets.symmetric(vertical: 18, horizontal: 15),
    );
  }

  @override
  void initState() {
    contactCon.text = widget.phone;
    super.initState();
  }

  final TextEditingController nameCon = TextEditingController();
  final TextEditingController emailCon = TextEditingController();
  final TextEditingController contactCon = TextEditingController();
  final TextEditingController referCon = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: const Text(
          "Registration Page",
          style: TextStyle(fontWeight: FontWeight.bold, color: Colors.black),
        ),
        centerTitle: true,
      ),
      body: ListView(
        children: [
          const SizedBox(
            height: 20,
          ),
          const Image(
            image: AssetImage(Assets.imagesTeam11),
            height: 200,
          ),
          const SizedBox(
            height: 20,
          ),
          const Align(
            alignment: Alignment.centerLeft,
            child: Padding(
              padding: EdgeInsets.only(left: 17.0, bottom: 5.0),
              child: Text(
                'Name',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w400,
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(
                left: 15.0, top: 0.0, right: 15.0, bottom: 8.0),
            child: TextFormField(
              style: const TextStyle(fontSize: 14),
              decoration: getInputDecoration(
                'Name',
                Icons.home,
              ),
              controller: nameCon,
              keyboardType: TextInputType.name,
            ),
          ),
          const Align(
            alignment: Alignment.centerLeft,
            child: Padding(
              padding: EdgeInsets.only(left: 17.0, bottom: 5.0),
              child: Text(
                'Email',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w400,
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(
                left: 15.0, top: 0.0, right: 15.0, bottom: 8.0),
            child: TextFormField(
              style: const TextStyle(fontSize: 14),
              decoration: getInputDecoration(
                'Your Email here',
                Icons.email,
              ),
              controller: emailCon,
              keyboardType: TextInputType.emailAddress,
            ),
          ),
          const Align(
            alignment: Alignment.centerLeft,
            child: Padding(
              padding: EdgeInsets.only(left: 17.0, bottom: 5.0),
              child: Text(
                'Contact Number',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w400,
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(
                left: 15.0, top: 0.0, right: 15.0, bottom: 8.0),
            child: TextFormField(
              style: const TextStyle(fontSize: 14),
              decoration: getInputDecoration(
                'Contact here',
                Icons.phone,
              ),
              readOnly: true,
              controller: contactCon,
              keyboardType: TextInputType.phone,
            ),
          ),
          const Align(
            alignment: Alignment.centerLeft,
            child: Padding(
              padding: EdgeInsets.only(left: 17.0, bottom: 5.0),
              child: Text(
                'Referral Code',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w400,
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(
                left: 15.0, top: 0.0, right: 15.0, bottom: 8.0),
            child: TextFormField(
              style: const TextStyle(fontSize: 14),
              decoration: getInputDecoration(
                'Code here(* optional)',
                Icons.remove_from_queue_outlined,
              ),
              controller: referCon,
              keyboardType: TextInputType.name,
            ),
          ),
          Center(
            child: CustomButton(
              onTap: () {
                userRegister(nameCon.text, emailCon.text, contactCon.text,
                    referCon.text);
              },
              text: 'Send OTP',
            ),
          )
        ],
      ),
    );
  }

  userRegister(String nameCon, String emailCon, String contactCon,
      String referCon) async {
    final response = await http.post(Uri.parse(ApiUrl.register),
        headers: <String, String>{
          'content-Type': 'application/json; charset=UTF-8',
        },
        body: jsonEncode(<String, String>{
          "name": nameCon,
          "email": emailCon,
          "mobile": contactCon,
          "type": "user",
        }));
    var data = jsonDecode(response.body);
    if (data["responsecode"] == "200") {
      var userid = data['data']["user_id"];
      Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => VerifyPage(
                    phone: contactCon,
                    userid: userid,
                  )));
    } else {
      Utils.flushBarErrorMessage(data["message"], context, Colors.white);
    }
  }
}
