import 'dart:async';

import 'package:flutter/material.dart';
import 'package:dream11_pw/BottomNavBar/bottom_nav_bar.dart';
class WithdrawInstantPage extends StatefulWidget {
  const WithdrawInstantPage({super.key});

  @override
  State<WithdrawInstantPage> createState() => _WithdrawInstantPageState();
}

class _WithdrawInstantPageState extends State<WithdrawInstantPage> {
  void initState(){
    super.initState();
    Timer(Duration(seconds: 4),
            ()=>Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=> BottomNavBar()))
    );
  }
  @override
  Widget build(BuildContext context) {
    final heights=MediaQuery.of(context).size.height;
    final widths=MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Colors.red,
      body:Center(
        child: Container(
          height: heights/3,
          // color: Colors.blue,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              CircleAvatar(backgroundColor:Colors.white,
          child: Icon(Icons.check,color: Colors.red,),),
              Text('Withdrawal Request Sent',style: TextStyle(color: Colors.white,
                  fontWeight: FontWeight.bold,fontSize:heights/35 ),),
              Container(
                height: heights/12,
                width: widths/1.2,
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10)
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [Icon(Icons.star,color: Colors.red,),
                  Center(
                    child: Text('You will get refund with in 24 \n            working hours',
                      style: TextStyle(color: Colors.red,
                    fontSize: heights/45),),
                  )
                  ],
                ),
              )
            ],
          ),
        ),
      )
    );
  }
}
