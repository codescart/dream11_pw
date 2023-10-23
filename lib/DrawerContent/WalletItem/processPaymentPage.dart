import 'dart:async';

import 'package:flutter/material.dart';
import 'package:dream11_pw/BottomNavBar/bottom_nav_bar.dart';
class ProcessPaymentPage extends StatefulWidget {
  const ProcessPaymentPage({super.key});

  @override
  State<ProcessPaymentPage> createState() => _ProcessPaymentPageState();
}

class _ProcessPaymentPageState extends State<ProcessPaymentPage> {
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
            height: heights/3.9,
            // color: Colors.blue,
            child: Column(
              // mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                CircleAvatar(backgroundColor:Colors.white,radius: heights/25,
                  child: Icon(Icons.check,color: Colors.red,size: heights/20,),),
                SizedBox(height: heights/40,),
                Text('Payment Done',style: TextStyle(color: Colors.white,
                    fontWeight: FontWeight.bold,fontSize:heights/25 ),),
                SizedBox(height: heights/45,),
                  Text('Your Payment is successfully',
                    style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,
                        fontSize: heights/30),),
                Text('done.',
                  style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,
                      fontSize: heights/30),)
              ],
            ),
          ),
        )
    );
  }
}
