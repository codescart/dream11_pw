import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';
import 'package:dream11_pw/Model/player_list_model.dart';
import 'package:dream11_pw/Constant/api_url.dart';
import 'package:dream11_pw/generated/assets.dart';
import 'package:http/http.dart'as http;

class playerprofile extends StatefulWidget {
  final PlayerListModel bowldata ;
   playerprofile( {Key? key, required this.bowldata,});

  @override
  State<playerprofile> createState() => _playerprofileState();
}

class _playerprofileState extends State<playerprofile> {


  @override
  Widget build(BuildContext context) {
    final heights=MediaQuery.of(context).size.height;
    final widths=MediaQuery.of(context).size.width;
    return SafeArea(
      child: Scaffold(
        body:
        SlidingUpPanel(
          maxHeight: heights/1.45,
          minHeight: heights/1.9,

          renderPanelSheet: false,
          // panel
          panel: Container(
            decoration:  BoxDecoration(
              color: Color.fromARGB(255, 253, 253, 253),
              borderRadius: BorderRadius.only(topLeft:Radius.circular(40.0),topRight:Radius.circular(40.0) ),

            ),
            
            //  margin: const EdgeInsets.all(24.0),
            child: Column(
              children: [
                Padding(
                  padding:  EdgeInsets.symmetric(horizontal: 25.0,vertical: 25),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('Career State',
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: heights / 50),
                      ),
                      Text('India',
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: heights / 50),
                      )
                    ],
                  ),
                ),
                Text('ODI',
                  style: TextStyle(
                      fontWeight: FontWeight.bold, fontSize: heights / 50),
                ),
                Padding(
                  padding:  EdgeInsets.symmetric(horizontal: 25.0,vertical: 25),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        children: [
                          Text('80',
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: heights / 50),
                          ),
                          Text('Matches',
                            style: TextStyle(
                                fontWeight: FontWeight.w400, fontSize: heights /60),
                          ),
                        ],
                      ),
                      Column(
                        children: [
                          Text('4005',
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: heights / 50),
                          ),
                          Text('Runs',
                            style: TextStyle(
                                fontWeight: FontWeight.w400, fontSize: heights /60),
                          ),
                        ],
                      ),
                      Column(
                        children: [
                          Text('5',
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: heights / 50),
                          ),
                          Text('Wickets',
                            style: TextStyle(
                                fontWeight: FontWeight.w400, fontSize: heights /60),
                          ),
                        ],
                      )
                    ],
                  ),
                ),
                Divider(
                  thickness: 2,
                  endIndent: 25,
                  indent: 25,

                ),
                Text('T20',
                  style: TextStyle(
                      fontWeight: FontWeight.bold, fontSize: heights / 50),
                ),
                Padding(
                  padding:  EdgeInsets.symmetric(horizontal: 25.0,vertical: 25),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        children: [
                          Text('80',
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: heights / 50),
                          ),
                          Text('Matches',
                            style: TextStyle(
                                fontWeight: FontWeight.w400, fontSize: heights /60),
                          ),
                        ],
                      ),
                      Column(
                        children: [
                          Text('4005',
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: heights / 50),
                          ),
                          Text('Runs',
                            style: TextStyle(
                                fontWeight: FontWeight.w400, fontSize: heights /60),
                          ),
                        ],
                      ),
                      Column(
                        children: [
                          Text('5',
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: heights / 50),
                          ),
                          Text('Wickets',
                            style: TextStyle(
                                fontWeight: FontWeight.w400, fontSize: heights /60),
                          ),
                        ],
                      )
                    ],
                  ),
                ),
                Divider(
                  thickness: 2,
                  endIndent: 25,
                  indent: 25,

                ),
                Text('TEST',
                  style: TextStyle(
                      fontWeight: FontWeight.bold, fontSize: heights / 50),
                ),
                Padding(
                  padding:  EdgeInsets.symmetric(horizontal: 25.0,vertical: 25),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        children: [
                          Text('80',
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: heights / 50),
                          ),
                          Text('Matches',
                            style: TextStyle(
                                fontWeight: FontWeight.w400, fontSize: heights /60),
                          ),
                        ],
                      ),
                      Column(
                        children: [
                          Text('4005',
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: heights / 50),
                          ),
                          Text('Runs',
                            style: TextStyle(
                                fontWeight: FontWeight.w400, fontSize: heights /60),
                          ),
                        ],
                      ),
                      Column(
                        children: [
                          Text('5',
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: heights / 50),
                          ),
                          Text('Wickets',
                            style: TextStyle(
                                fontWeight: FontWeight.w400, fontSize: heights /60),
                          ),
                        ],
                      )
                    ],
                  ),
                ),
                Divider(
                  thickness: 2,
                  endIndent: 25,
                  indent: 25,

                ),
                Text('IPL',
                  style: TextStyle(
                      fontWeight: FontWeight.bold, fontSize: heights / 50),
                ),
                Padding(
                  padding:  EdgeInsets.symmetric(horizontal: 25.0,vertical: 25),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        children: [
                          Text('80',
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: heights / 50),
                          ),
                          Text('Matches',
                            style: TextStyle(
                                fontWeight: FontWeight.w400, fontSize: heights /60),
                          ),
                        ],
                      ),
                      Column(
                        children: [
                          Text('4005',
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: heights / 50),
                          ),
                          Text('Runs',
                            style: TextStyle(
                                fontWeight: FontWeight.w400, fontSize: heights /60),
                          ),
                        ],
                      ),
                      Column(
                        children: [
                          Text('5',
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: heights / 50),
                          ),
                          Text('Wickets',
                            style: TextStyle(
                                fontWeight: FontWeight.w400, fontSize: heights /60),
                          ),
                        ],
                      )
                    ],
                  ),
                ),
                Divider(
                  thickness: 2,
                  endIndent: 25,
                  indent: 25,

                ),

              ],
            )
          ),
          collapsed:Container(
            decoration:  BoxDecoration(
              color: Color.fromARGB(255, 253, 253, 253),
              borderRadius: BorderRadius.only(topLeft:Radius.circular(40.0),topRight:Radius.circular(40.0) ),

            ),


            child: Column(
              children: [
                Padding(
                  padding:  EdgeInsets.only(top: 50.0,left: 35,right: 35),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('Name :',
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: heights / 50),
                      ),
                      Text('${widget.bowldata.name}',
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: heights / 50),
                      )
                    ],
                  ),
                ),
                Divider(
                  thickness: 2,
                  endIndent: 25,
                  indent: 25,

                ),
                Padding(
                  padding:  EdgeInsets.only(top: 20.0,left: 35,right: 35),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('D.O.B :',
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: heights / 50),
                      ),
                      Text(widget.bowldata.dob.toString().replaceAll('00:00:00.000', ''),
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: heights / 50),
                      )
                    ],
                  ),
                ),
                Divider(
                  thickness: 2,
                  endIndent: 25,
                  indent: 25,

                ),
                Padding(
                  padding:  EdgeInsets.only(top: 20.0,left: 35,right: 35),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('Team Name :',
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: heights / 50),
                      ),
                      Text(widget.bowldata.teamName.toString(),
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: heights / 50),
                      )
                    ],
                  ),
                ),
                Divider(
                  thickness: 2,
                  endIndent: 25,
                  indent: 25,

                ),
                Padding(
                  padding:   EdgeInsets.only(top: 20.0,left: 35,right: 35),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('Points :',
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: heights / 50),
                      ),
                      Text(widget.bowldata.points.toString(),
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: heights / 50),
                      )
                    ],
                  ),
                ),
                Divider(
                  thickness: 2,
                  endIndent: 25,
                  indent: 25,

                ),
                Padding(
                  padding:   EdgeInsets.only(top: 20.0,left: 35,right: 35),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('Batting :',
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: heights / 50),
                      ),
                      Text(widget.bowldata.bats.toString(),
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: heights / 50),
                      )
                    ],
                  ),
                ),
                Divider(
                  thickness: 2,
                  endIndent: 25,
                  indent: 25,

                ),
                Padding(
                  padding:  EdgeInsets.only(top: 20.0,left: 35,right: 35),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('Bowling :',
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: heights / 50),
                      ),
                      Text(widget.bowldata.bowls.toString(),
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: heights / 50),
                      )
                    ],
                  ),
                ),
                Divider(
                  thickness: 2,
                  endIndent: 25,
                  indent: 25,

                ),
                Padding(
                  padding:  EdgeInsets.only(top: 20.0,),
                  child: Text('↑↑ Swipe up to check career state ↑↑',
                    style: TextStyle(
                        fontWeight: FontWeight.bold, fontSize: heights / 70,color: Colors.grey),
                  ),
                ),
              ],
            )
          ) ,
       
          body: Container(
            height: heights,
            width: widths,
            color: Colors.red,
            child: Column(
              children: [
                Align(
                  alignment: Alignment.topLeft,
                  child: IconButton(onPressed: (){
                    Navigator.pop(context);
                  },
                    icon: Icon(Icons.arrow_back,color: Colors.white,),),
                ),
                Container(
                  height: heights/3.8,
                  width: widths/2,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      fit: BoxFit.fill,
                      image: NetworkImage(widget.bowldata.image.toString())
                    )
                  ),

                ),
                Container(
                  decoration: BoxDecoration(borderRadius: BorderRadius.all(Radius.circular(15),),
                    color: Colors.white,
                  ),
                  height: heights/17,
                  width: widths/1.5,
                  child:   Center(
                    child: Text(widget.bowldata.name.toString(),
                      style: TextStyle(
                          fontWeight: FontWeight.bold, fontSize: heights / 50),
                    ),
                  ),
                )
              ],
            ),
          ),

        ),
      ),
    );
  }
  var data;
  playerinfo() async {

    final response = await http.post(
        Uri.parse(
        ApiUrl.playerInformation),
        headers: <String, String>{
          'content-Type': 'application/json; charset=UTF-8',
        },
        body: jsonEncode(<String, String>{
          // "player_id": widget.pid,
        })
    );
    final datas = jsonDecode(response.body);

    if (datas['responsecode'] == '200') {
      setState(() {
        data = datas['data'];
      });
      print(data);
    } else {
      throw Exception(datas['message']);
    }
  }
  @override
  void initState() {
    // playerinfo();
    // TODO: implement initState
    super.initState();
  }
}
