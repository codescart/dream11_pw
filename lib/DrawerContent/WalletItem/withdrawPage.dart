import 'package:flutter/material.dart';
import 'package:dream11_pw/Home/home_page.dart';
import 'package:dream11_pw/BottomNavBar/bottom_nav_bar.dart';

import 'withdrawInstant.dart';
class WithdrawPage extends StatefulWidget {
  const WithdrawPage({super.key});

  @override
  State<WithdrawPage> createState() => _WithdrawPageState();
}

class _WithdrawPageState extends State<WithdrawPage> {
  @override
  Widget build(BuildContext context)  {
    final heights=MediaQuery.of(context).size.height;
    final widths=MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.red,
        leading: InkWell(
            onTap: (){
              Navigator.push(context, MaterialPageRoute(builder: (context)=> BottomNavBar()));
            },
            child: Icon(Icons.arrow_back,)),
        title:Text('Withdraw'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.wallet,size:heights/10,color: Colors.red,),
            SizedBox(height: heights/8,),
            SizedBox(
                height: heights/6,
                width:widths/1.1,
                child: TextField(
                  decoration: InputDecoration(
                    hintText: 'Enter Amount',hintStyle: TextStyle(color: Colors.grey),
                    enabledBorder: const OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(12.0)),
                      borderSide: BorderSide(color: Colors.red, width: 1),
                    ),
                    focusedBorder: const OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(12.0)),
                      borderSide: BorderSide(color: Colors.red, width: 1),
                    ),
                    border: const OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.red),
                      borderRadius: BorderRadius.all(
                        Radius.circular(12.0),
                      ),
                    ),
                  ),
                )
            ),
            Container(
              height: heights/18,
              width:widths/1.8,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                  color: Colors.red
              ),
              child: Center(child: InkWell(
                onTap: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context)=> WithdrawInstantPage()));
                  },
                child: Text('Submit Request',
                  style: TextStyle(color: Colors.white,fontSize:heights/45 ),),
              )),
            )
          ],
        ),
      ),
    );
  }
}
