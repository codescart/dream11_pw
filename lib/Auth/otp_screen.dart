// ignore_for_file: depend_on_referenced_packages, use_build_context_synchronously

import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:pinput/pinput.dart';
import 'package:dream11_pw/Constant/Button/rectangleButton.dart';
import 'package:dream11_pw/BottomNavBar/bottom_nav_bar.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../Utils/utils.dart';
import 'package:http/http.dart'as http;
import 'package:flutter/gestures.dart';

class VerifyPage extends StatefulWidget {
  final String phone;
  final String userid;
  const VerifyPage(
      {super.key,
      required this.phone,
      required this.userid});

  @override
  State<VerifyPage> createState() => _VerifyPageState();
}

class _VerifyPageState extends State<VerifyPage> {
  Color focusedBorderColor = Colors.black;
  Color fillColor = Colors.red;
  Color borderColor = Colors.black;

  final defaultPinTheme = PinTheme(
    width: 56,
    height: 56,
    textStyle: const TextStyle(
      fontSize: 22,
      color: Color.fromRGBO(30, 60, 87, 1),
    ),
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(19),
      border: Border.all(color: Colors.white),
    ),
  );

  TextEditingController code = TextEditingController();
  @override
  Widget build(BuildContext context) {
    final heights = MediaQuery.of(context).size.height;
    // final widths=MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: SizedBox(
          height: heights / 2,
          child: Column(
            children: [
              Text(
                'Verification',
                style: TextStyle(
                    fontSize: heights / 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.black),
              ),
              SizedBox(
                height: heights / 35,
              ),
              Text(
                'Enter the code sent to the number',
                style: TextStyle(fontSize: heights / 40, color: Colors.black),
              ),
              SizedBox(
                height: heights / 35,
              ),
              Text(
                '+91${widget.phone}',
                style: TextStyle(
                    fontSize: heights / 35,
                    fontWeight: FontWeight.bold,
                    color: Colors.black),
              ),
              SizedBox(
                height: heights / 30,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 18, right: 18),
                child: Center(
                  child: SizedBox(
                    height: 40,
                    child: Pinput(
                      controller: code,
                      length: 6,
                      pinputAutovalidateMode: PinputAutovalidateMode.onSubmit,
                      showCursor: true,
                      focusedPinTheme: defaultPinTheme.copyWith(
                        decoration: defaultPinTheme.decoration!.copyWith(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(12),
                          border: Border.all(color: Colors.black),
                        ),
                      ),
                      submittedPinTheme: defaultPinTheme.copyWith(
                        decoration: defaultPinTheme.decoration!.copyWith(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(12),
                          border: Border.all(color: Colors.black),
                        ),
                      ),
                      errorPinTheme: defaultPinTheme.copyBorderWith(
                        border: Border.all(color: Colors.redAccent),
                      ),
                      disabledPinTheme: defaultPinTheme.copyWith(
                        decoration: defaultPinTheme.decoration!.copyWith(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(12),
                          border: Border.all(color: Colors.black),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: heights / 20,
              ),
              CustomButton(
                  onTap: () {
                    _verifyOtpCode(code.text);
                  },
                  text: 'Submit'),
              RichText(
                text: TextSpan(
                  children: [
                    const TextSpan(
                      text: "Don't Received Otp?",
                      style: TextStyle(color: Colors.black), // Customize the style as needed
                    ),
                    TextSpan(
                      text: 'Resend',
                      style: const TextStyle(color: Colors.red),
                      recognizer: TapGestureRecognizer()
                        ..onTap  = () {
                         sendOtp();
                        },
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
  @override
  void initState() {
    super.initState();
    sendOtp();
  }

  _verifyOtpCode(String code) async {
    final mobileNo=widget.phone;
    try {
      final response = await http.post(
        Uri.parse('https://otp.hopegamings.in/verifyotp.php?mobile=$mobileNo&otp=$code'),
      );
      if(response.statusCode==200){
        final data=jsonDecode(response.body);
        if(data['error']=='200'){
          final prefs = await SharedPreferences.getInstance();
          prefs.setString('userid', widget.userid.toString());
          Navigator.pushReplacement(context,
              MaterialPageRoute(builder: (context) => const BottomNavBar()));
        }else{
          Utils.showToast('please enter valid otp');
        }
      }else{
        if (kDebugMode) {
          print('verify failed');
        }
      }
    }catch(e) {
      if (kDebugMode) {
        print('Error fetching data: $e');
      }
    }
  }

  sendOtp() async {
    final mobileNo=widget.phone;
    try {
      final response = await http.get(
        Uri.parse('https://otp.hopegamings.in/send_otp.php?mobile=$mobileNo&digit=6&mode=live'),
      );
      if(response.statusCode==200){
        if (kDebugMode) {
          print('success');
        }

      }else{
        if (kDebugMode) {
          print('failed');
        }
      }
  }catch(e) {
      if (kDebugMode) {
        print('Error fetching data: $e');
      }
    }
  }
}
