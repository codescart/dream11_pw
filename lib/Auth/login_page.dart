// ignore_for_file: use_build_context_synchronously, depend_on_referenced_packages

import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import 'package:dream11_pw/Constant/Button/rectangleButton.dart';
import 'package:dream11_pw/Constant/api_url.dart';
import 'package:dream11_pw/Auth/otp_screen.dart';
import 'package:http/http.dart' as http;
import 'package:dream11_pw/Auth/register_screen.dart';
import '../Constant/images.dart';
import '../Utils/utils.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController phoneController = TextEditingController();
  FocusNode focusNode = FocusNode();
  @override
  Widget build(BuildContext context) {
    final heights = MediaQuery.of(context).size.height;
    final widths = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Colors.grey,
      body: Stack(
        children: [
          ListView(
            children: [
              Center(
                child: Image(
                  image: const AssetImage(imagesTeam11),
                  height: heights / 2.5,
                  width: widths / 4.5,
                ),
              ),
            ],
          ),
          Positioned(
              bottom: 0,
              child: Container(
                height: heights / 1.8,
                width: widths,
                decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(20),
                        topRight: Radius.circular(20))),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SizedBox(
                      height: heights / 20,
                    ),
                    Text(
                      'ENTER YOUR PHONE NUMBER',
                      style: TextStyle(
                          fontWeight: FontWeight.w900, fontSize: heights / 40),
                    ),
                    SizedBox(
                      height: heights / 40,
                    ),
                    Text(
                      "We'll send you a verification code on the",
                      style: TextStyle(
                          fontWeight: FontWeight.bold, fontSize: heights / 50),
                    ),
                    Text(
                      "same number",
                      style: TextStyle(
                          fontWeight: FontWeight.bold, fontSize: heights / 50),
                    ),
                    SizedBox(
                      height: heights / 10,
                    ),
                    Center(
                      child: SizedBox(
                        // height: heights/30,
                        width: widths / 1.25,
                        child: IntlPhoneField(
                          disableLengthCheck: true,
                          controller: phoneController,
                          focusNode: focusNode,
                          keyboardType: TextInputType.number,
                          textAlignVertical: TextAlignVertical.bottom,
                          style: const TextStyle(color: Colors.black),
                          cursorColor: const Color(0xFF075E54),
                          decoration: InputDecoration(
                            counterText: "",
                            contentPadding: const EdgeInsets.only(bottom: 13.0),
                            enabledBorder: const OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(5.0)),
                              borderSide:
                                  BorderSide(color: Colors.black, width: 1),
                            ),
                            focusedBorder: const OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(5.0)),
                              borderSide:
                                  BorderSide(color: Colors.black, width: 1),
                            ),
                            border: const OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.black),
                              borderRadius: BorderRadius.all(
                                Radius.circular(5.0),
                              ),
                            ),
                            focusedErrorBorder: const OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(5.0)),
                              borderSide: BorderSide(color: Color(0xFFF65054)),
                            ),
                            errorBorder: const OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(5.0)),
                              borderSide: BorderSide(color: Color(0xFFF65054)),
                            ),
                            hintText: 'Phone Number',
                            hintStyle: TextStyle(
                              color: Colors.black,
                              fontSize: heights / 60,
                            ),
                          ),
                          languageCode: "IN",
                          initialCountryCode: 'IN',
                          dropdownIcon: const Icon(
                            Icons.arrow_drop_down_rounded,
                            color: Colors.black,
                          ),
                          dropdownTextStyle:
                              (const TextStyle(color: Colors.black)),
                          dropdownIconPosition: IconPosition.trailing,
                          onChanged: (phone) {
                            if (kDebugMode) {
                              print(phone.completeNumber);
                            }
                          },
                          onCountryChanged: (country) {
                            if (kDebugMode) {
                              print('Country changed to: ${country.name}');
                            }
                          },
                        ),
                      ),
                    ),
                    SizedBox(
                      height: heights / 10,
                    ),
                    CustomButton(
                      onTap: () {
                        userLogin(phoneController.text);
                      },
                      text: 'Send OTP',
                    )
                  ],
                ),
              ))
        ],
      ),
    );
  }

  userLogin(String phoneController) async {
    final response = await http.post(Uri.parse(ApiUrl.login),
        headers: <String, String>{
          'content-Type': 'application/json; charset=UTF-8',
        },
        body: jsonEncode(<String, String>{
          "mobile": phoneController,
          "type": "user",
        }));
    var data = jsonDecode(response.body);
    if (data["responsecode"] == "200") {
      var userid = data["data"]["user_id"];
      Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => VerifyPage(
                  phone: phoneController, userid: userid)));
    } else {
      Utils.flushBarErrorMessage(data["message"], context, Colors.white);
      Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => RegisterPage(phone: phoneController)));
    }
  }
}
