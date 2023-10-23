import 'package:flutter/material.dart';

import 'AboutUs/ABOUTUS.dart';
import 'HowToPlay/HOWTOPLAY.dart';
import 'InviteCode/invitationCode.dart';
import 'InviteFriends/refer_and_earn_screen.dart';
import 'KYC/verifyAccontPage.dart';
import 'Legality/legality.dart';
import 'WithdrawlCashpolicy.dart';
import 'refundpolicy.dart';

class SettingPage extends StatefulWidget {
  const SettingPage({super.key});

  @override
  State<SettingPage> createState() => _SettingPageState();
}

class _SettingPageState extends State<SettingPage> {
  @override
  Widget build(BuildContext context) {
    final heights=MediaQuery.of(context).size.height;
    final widths=MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.red,
        leading: InkWell(
            onTap: (){Navigator.pop(context);},
            child: Icon(Icons.arrow_back)),
        title: Text('Settings'),
      ),
      body:Column(
        children: [
          InkWell(
            onTap: (){Navigator.push(context, MaterialPageRoute(builder: (context)=>ReferAndEarnScreen()));},
            child: Container(
              height: heights/15,
              decoration: BoxDecoration(
                border: Border(bottom: BorderSide(width: 1,color: Colors.grey))
              ),
              child: Padding(
                padding: EdgeInsets.only(left:widths/20,right: widths/20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                  Text('Invite Friends'),
                  Icon(Icons.arrow_forward_ios)
                ],),
              ),
            ),
          ),
          InkWell(
            onTap: (){Navigator.push(context, MaterialPageRoute(builder: (context)=>InvitationPage()));},
            child: Container(
              height: heights/15,
              decoration: BoxDecoration(
                  border: Border(bottom: BorderSide(width: 1,color: Colors.grey))
              ),
              child: Padding(
                padding: EdgeInsets.only(left:widths/20,right: widths/20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('Invite Code'),
                    Icon(Icons.arrow_forward_ios)
                  ],),
              ),
            ),
          ),
          Container(
            height: heights/15,
            decoration: BoxDecoration(
                border: Border(bottom: BorderSide(width: 1,color: Colors.grey))
            ),
            child: Padding(
              padding: EdgeInsets.only(left:widths/20,right: widths/20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('Points System'),
                  Icon(Icons.arrow_forward_ios)
                ],),
            ),
          ),
          InkWell(
            onTap: (){Navigator.push(context, MaterialPageRoute(builder: (context)=>VerifyAccountPage()));},
            child: Container(
              height: heights/15,
              decoration: BoxDecoration(
                  border: Border(bottom: BorderSide(width: 1,color: Colors.grey))
              ),
              child: Padding(
                padding: EdgeInsets.only(left:widths/20,right: widths/20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('KYC'),
                    Spacer(),
                    Container(
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                          color: Colors.grey[300],
                          borderRadius: BorderRadius.circular(20)),
                      height: heights/25,width: widths/4,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Text('Verified',style: TextStyle(color: Colors.red,fontSize: heights/50),),
                        Icon(Icons.check,color: Colors.red,)
                      ],
                    ),),
                    Icon(Icons.arrow_forward_ios)
                  ],),
              ),
            ),
          ),
          InkWell(
            onTap: (){
              Navigator.push(context, MaterialPageRoute(builder: (context)=>HOWTO_PLAY()));
              //ABOUTus

            },
            child: Container(
              height: heights/15,
              decoration: BoxDecoration(
                  border: Border(bottom: BorderSide(width: 1,color: Colors.grey))
              ),
              child: Padding(
                padding: EdgeInsets.only(left:widths/20,right: widths/20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('How To Play'),
                    Icon(Icons.arrow_forward_ios)
                  ],),
              ),
            ),
          ),
          InkWell(
            onTap: (){
              Navigator.push(context, MaterialPageRoute(builder: (context)=>ABOUTus()));
              //ABOUTus

            },
            child: Container(
              height: heights/15,
              decoration: BoxDecoration(
                  border: Border(bottom: BorderSide(width: 1,color: Colors.grey))
              ),
              child: Padding(
                padding: EdgeInsets.only(left:widths/20,right: widths/20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('About Us'),
                    Icon(Icons.arrow_forward_ios)
                  ],),
              ),
            ),
          ),
          InkWell(
            onTap: (){
              Navigator.push(context, MaterialPageRoute(builder: (context)=>Lagality()));
            },
            child: Container(
              height: heights/15,
              decoration: BoxDecoration(
                  border: Border(bottom: BorderSide(width: 1,color: Colors.grey))
              ),
              child: Padding(
                padding: EdgeInsets.only(left:widths/20,right: widths/20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('Legality'),
                  Icon(Icons.arrow_forward_ios)
                  ]
              ),
            ),
            ),
          ),
          InkWell(
            onTap: (){
              Navigator.push(context, MaterialPageRoute(builder: (context)=>WITHDRAWL_CASH_POLICY()));
            },
            child: Container(
              height: heights/15,
              decoration: BoxDecoration(
                  border: Border(bottom: BorderSide(width: 1,color: Colors.grey))
              ),
              child: Padding(
                padding: EdgeInsets.only(left:widths/20,right: widths/20),
                child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('Withdrawl Cash Policy'),
                      Icon(Icons.arrow_forward_ios)
                    ]
                ),
              ),
            ),
          ),
          InkWell(
            onTap: (){
              Navigator.push(context, MaterialPageRoute(builder: (context)=>refund_POLICY()));
            },
            child: Container(
              height: heights/15,
              decoration: BoxDecoration(
                  border: Border(bottom: BorderSide(width: 1,color: Colors.grey))
              ),
              child: Padding(
                padding: EdgeInsets.only(left:widths/20,right: widths/20),
                child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('Refund Policy'),
                      Icon(Icons.arrow_forward_ios)
                    ]
                ),
              ),
            ),
          )
        ],
      )
    );
  }
}
