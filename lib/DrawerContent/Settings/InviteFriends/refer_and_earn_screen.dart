// ignore_for_file: depend_on_referenced_packages

import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_share/flutter_share.dart';
import 'package:provider/provider.dart';
import 'package:dream11_pw/Api/Api_controller/r&flist_controller.dart';
import 'package:dream11_pw/Constant/api_url.dart';
import 'package:dream11_pw/Constant/images.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';
import 'package:http/http.dart'as http;
import 'package:shared_preferences/shared_preferences.dart';
import '../../../Provider/view_profile_provider.dart';
import 'clipBoardPage.dart';

class ReferAndEarnScreen extends StatefulWidget {
  const ReferAndEarnScreen({super.key});

  @override
  State<ReferAndEarnScreen> createState() => _ReferAndEarnScreenState();
}

class _ReferAndEarnScreenState extends State<ReferAndEarnScreen> {
  @override
  Widget build(BuildContext context) {
    final userData = Provider.of<ProfileViewProvider>(context).userData;
    final heights = MediaQuery.of(context).size.height;
    final widths = MediaQuery.of(context).size.width;
    return SafeArea(
      child: Scaffold(
          appBar: AppBar(
            elevation: 0,
            backgroundColor: Colors.red,
            leading: InkWell(
                onTap: () {
                  Navigator.pop(context);
                },
                child: const Icon(Icons.arrow_back)),
            title: const Text('Refer & Earn'),
          ),
          body: SlidingUpPanel(
            maxHeight: heights / 1.2,
            minHeight: heights / 10,

            renderPanelSheet: false,
            // panel
            panel: Container(
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(40.0),
                    topRight: Radius.circular(40.0)),
              ),

              //  margin: const EdgeInsets.all(24.0),
              child: ListView(
                padding: const EdgeInsets.symmetric(vertical: 15,horizontal: 15),
                shrinkWrap: true,
                children: [
                  Center(
                    child: Text(
                      'Share Your Invitation Code',
                      style: TextStyle(
                          fontSize: heights / 50,
                          fontWeight: FontWeight.w500,
                          color: Colors.black),
                    ),
                  ),
                  SizedBox(
                    height: heights/20,
                  ),
                  FutureBuilder<List<refer_earn>>(
                      future: que(userData!.referralCode.toString()),
                      builder: (context, snapshot) {
                        if (snapshot.connectionState == ConnectionState.waiting) {
                          return const Center(
                            child: CircularProgressIndicator(),
                          );
                        }
                        else if (snapshot.hasError) {
                          return Center(
                            child: Text('Error: ${snapshot.error}'),
                          );
                        }
                        else if (!snapshot.hasData || snapshot.data!.isEmpty) {
                          return const Center(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [

                                Text(
                                  "No Referral List",
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 25,
                                      color: Colors.black
                                  ),
                                ),
                              ],
                            ),
                          );
                        }
                        else {
                          return ListView.builder(
                              itemCount: snapshot.data!.length,
                              scrollDirection: Axis.vertical,
                              shrinkWrap: true,
                              physics: const BouncingScrollPhysics(),
                              itemBuilder: (BuildContext context, int index) {
                                return Card(
                                  elevation: 3,
                                  child: ListTile(
                                    leading: CircleAvatar(
                                      backgroundColor: Colors.white,
                                      backgroundImage: NetworkImage('${snapshot.data![index].image}',),
                                    ),
                                    title: Center(
                                      child: Text(
                                        '${snapshot.data![index].name}',
                                        style: TextStyle(
                                            fontSize: heights / 60,
                                            fontWeight: FontWeight.w900,
                                            //color: Colors.white
                                    ),
                                      ),
                                    ),
                                    subtitle: Center(
                                      child: Text(
                                          '${snapshot.data![index].email}',
                                        style: TextStyle(
                                            fontSize: heights / 70,
                                            fontWeight: FontWeight.w900,
                                            ),

                                   ),
                                    ),
                                    trailing: Column(
                                      children: [
                                        Text(
                                          '${snapshot.data![index].bonus}',
                                          style: TextStyle(
                                            fontSize: heights / 30,
                                            fontWeight: FontWeight.w900,
                                          ),

                                        ),
                                        Text(
                                          'BONUS',
                                          style: TextStyle(
                                            fontSize: heights / 80,
                                            fontWeight: FontWeight.w400,
                                          ),

                                        ),
                                      ],
                                    ),
                                  ),
                                );
                              });
                        }
                      }
                  ),

                ],
              ),
            ),
            collapsed: Container(
              decoration: const BoxDecoration(
                color: Colors.grey,
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(40.0),
                    topRight: Radius.circular(40.0)),
              ),
              child: Center(
                child: Text(
                  '⏫ Invited Friend List',
                  style: TextStyle(
                      fontSize: heights / 50,
                      fontWeight: FontWeight.w500,
                      color: Colors.black),
                ),
              ),
            ),
            body: SizedBox(
              height: heights,
              width: widths,
              child: Column(
                children: [
                  Container(
                    decoration: BoxDecoration(
                        color: Colors.red,
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.5),
                            spreadRadius: 5,
                            blurRadius: 7,
                            offset: const Offset(0,3), // changes position of shadow
                          ),
                        ],
                        borderRadius: const BorderRadius.only(
                            bottomLeft: Radius.circular(25),
                            bottomRight: Radius.circular(25))),
                    height: heights / 1.7,
                    width: widths,
                    child: Column(
                      //  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        SizedBox(
                          height: heights / 15,
                        ),
                        Text(
                          'Refer your friend',
                          style: TextStyle(
                              fontSize: heights / 30,
                              fontWeight: FontWeight.w900,
                              color: Colors.white),
                        ),
                        Text(
                          'and Earn',
                          style: TextStyle(
                              fontSize: heights / 30,
                              fontWeight: FontWeight.w900,
                              color: Colors.white),
                        ),
                        Container(
                          height: heights / 5,
                          width: widths / 2,
                          decoration: const BoxDecoration(
                              image: DecorationImage(
                            fit: BoxFit.fill,
                            image: AssetImage(Giftbox),
                          )),
                        ),
                        Text(
                          'Refer friend to us',
                          style: TextStyle(
                              fontSize: heights / 50,
                              fontWeight: FontWeight.w500,
                              color: Colors.white),
                        ),
                        Text(
                          'and you and your friends will set ₹ 100',
                          style: TextStyle(
                              fontSize: heights / 50,
                              fontWeight: FontWeight.w500,
                              color: Colors.white),
                        ),
                        SizedBox(
                          height: heights / 15,
                        ),
                        DottedBorder(
                          color: Colors.white,
                          borderType: BorderType.RRect,
                          strokeWidth: 1.5,
                          radius: const Radius.circular(12),
                          padding: const EdgeInsets.all(6),
                          child: ClipRRect(
                            borderRadius: const BorderRadius.all(Radius.circular(12)),
                            child: SizedBox(
                              height: heights / 12,
                              width: widths / 2,
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Column(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceEvenly,
                                    children: [
                                      Text(
                                        'Your Referral Code',
                                        style: TextStyle(
                                            fontSize: heights / 80,
                                            fontWeight: FontWeight.w300,
                                            color: Colors.white),
                                      ),
                                      Text(
                                       '${userData.referralCode}',
                                        style: TextStyle(
                                            fontSize: heights / 40,
                                            fontWeight: FontWeight.w900,
                                            color: Colors.white),
                                      ),
                                    ],
                                  ),
                                  const VerticalDivider(
                                    thickness: 2,
                                    color: Colors.white,
                                    indent: 5,
                                    endIndent: 5,
                                  ),
                                  InkWell(
                                    onTap: () {
                                      copyToClipboard(
                                          userData.referralCode.toString(), context);
                                    },
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Text(
                                          'Copy  ',
                                          style: TextStyle(
                                              fontSize: heights / 60,
                                              fontWeight: FontWeight.w900,
                                              color: Colors.white),
                                        ),
                                        Text(
                                          'Code  ',
                                          style: TextStyle(
                                              fontSize: heights / 60,
                                              fontWeight: FontWeight.w900,
                                              color: Colors.white),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: heights / 20,
                  ),
                  Text(
                    'Share Your Invitation Code',
                    style: TextStyle(
                        fontSize: heights / 50,
                        fontWeight: FontWeight.w500,
                        color: Colors.black),
                  ),
                  SizedBox(
                    height: heights / 30,
                  ),
                  InkWell(
                    onTap: () {
                      share(userData.referralCode.toString());
                    },
                    child: Container(
                      height: heights / 18,
                      width: widths / 2,
                      decoration: BoxDecoration(
                          color: Colors.red,
                          borderRadius: BorderRadius.circular(10)),
                      child: Center(
                          child: Text(
                        'Invite Your Friend',
                        style: TextStyle(
                            color: Colors.white, fontSize: heights / 40),
                      )),
                    ),
                  ),
                ],
              ),
            ),
          )),
    );
  }


  Future<void> share(String referralCode) async {
    await FlutterShare.share(
        title: 'Referral Code :$referralCode',
        text: 'Join Now & Get Exiting Prizes. here is my Referral Code : $referralCode',
        linkUrl: "",
        chooserTitle: 'Referral Code : $referralCode');
  }


  Future<List<refer_earn>> que(String referralCode)  async {
    final prefs = await SharedPreferences.getInstance();
    final userid = prefs.getString("userid");
    final response = await http
        .post(Uri.parse(ApiUrl.referFriendList),
        headers: <String,String>{
          'content-Type':'application/json; charset=UTF-8',
        },
        body:jsonEncode(<String,String>{
            "user_id":"$userid",
            "referral_code":referralCode
        })
    );
    if (response.statusCode == 200) {
      final jsonData = json.decode(response.body)['data'] as List<dynamic>;

      return jsonData.map((item) => refer_earn.fromJson(item)).toList();
    } else {
      throw Exception('Failed to load data');
    }
  }
}
