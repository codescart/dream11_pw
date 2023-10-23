// ignore_for_file: depend_on_referenced_packages

import 'dart:async';

import 'package:flutter/material.dart';
import 'package:dream11_pw/Constant/images.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:dream11_pw/BottomNavBar/bottom_nav_bar.dart';
import '../IntroductionScreen/Introduction_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState(){
    super.initState();
    harsh();
  }

  harsh()async{
    final prefs = await SharedPreferences.getInstance();
    final userid = prefs.getString("userid")??'0';


    Timer(const Duration(seconds: 3),
          ()=> userid !='0'?Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (context) => const BottomNavBar()))
          :Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) =>const IntroductionScreen(),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final heights=MediaQuery.of(context).size.height;
    final widths=MediaQuery.of(context).size.width;
    return Scaffold(
      body: SizedBox(
        height: heights,
        width: widths,
        child: SizedBox(
          height: heights/3,
          width: widths/3,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Image(image:  AssetImage(imagesTeam11), ),
              Text('Dream11.PW',style: TextStyle(fontWeight: FontWeight.bold,fontSize: heights/30),)
            ],
          ),
          // decoration: BoxDecoration(
          //     color: Colors.white,
          //     image:DecorationImage(image:  AssetImage(imagesTeam11),)
          // ),
          ),
        ),
    );
  }
}
