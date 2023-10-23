
// ignore_for_file: depend_on_referenced_packages

import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:dream11_pw/MyMatch/MyMatchWidget/MyUpcomingWidget/UpCoCreateTeamTab/up_c_create_team_tab_bar.dart';
import 'package:dream11_pw/MyMatch/MyMatchWidget/MyUpcomingWidget/UpCoMyTeamsView/up_c_my_teams_preview.dart';
import 'package:dream11_pw/MyMatch/MyMatchWidget/MyUpcomingWidget/up_c_tab_bar.dart';
import 'package:dream11_pw/generated/assets.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import '../../../../Constant/api_url.dart';
import '../../../../Constant/images.dart';
import '../../../../Model/my_match_model.dart';
import '../../../../Model/save_team_model.dart';

class UpSelectTeamAndJoin extends StatefulWidget {
  final MyMatchModel data;
  const UpSelectTeamAndJoin({super.key, required this.data});

  @override
  State<UpSelectTeamAndJoin> createState() => _UpSelectTeamAndJoinState();
}

class _UpSelectTeamAndJoinState extends State<UpSelectTeamAndJoin> {
  bool selectAll = false;
  List<bool> isSelected = [];
  bool isAllSelected = false;

  void toggleAllSelection() {
    setState(() {
      isAllSelected = !isAllSelected;
      isSelected = List<bool>.filled(saveTeamList.length, isAllSelected);
    });
  }
  int getSelectedItemCount() {
    return isSelected.where((element) => element).length;
  }
  var selectedTeamName;
  @override
  Widget build(BuildContext context) {
    final heights = MediaQuery.of(context).size.height;
    final widths = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: const Text("Select Teams"),
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(100),
          child: Container(
            padding: const EdgeInsets.only(top: 10, bottom:10),
            width: widths,
            color: Colors.white,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Padding(
                  padding: EdgeInsets.only(left: 10, bottom: 15),
                  child: Text("You can enter upTo 20 teams in this context"),
                ),
                Container(
                  decoration: BoxDecoration(
                    border: Border(
                      bottom: BorderSide(width: 1, color: Colors.grey.shade400),
                      top: BorderSide(width: 1, color: Colors.grey.shade400)
                    ),
                    color: Colors.grey.shade100,
                  ),

                  alignment: Alignment.centerRight,
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text("Select All(${isSelected.length})"),
                      Checkbox(
                        value: isAllSelected,
                        onChanged: (value) {
                          toggleAllSelection();
                        },
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
      bottomSheet: InkWell(
        onTap: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => UpCoCreateTeamTapBarPage(
                    myMatchModel: widget.data,
                  )));
        },
        child: ListTile(
          contentPadding: const EdgeInsets.symmetric(horizontal: 10),
          title: const Text("Join with"),
          subtitle:getSelectedItemCount()==1?Text(selectedTeamName.toString()): Text("${getSelectedItemCount()} Teams"),
          trailing: InkWell(
            onTap: (){
              showDialog(
                  barrierColor: Colors.transparent,
                  context: context,
                  builder: (context) => AlertDialog(
                    shape: const RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(
                            Radius.circular(20))),
                    backgroundColor: Colors.white,
                    content: Container(
                      height: heights / 3.5,
                      width: widths / 1.5,
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius:
                          BorderRadius.circular(30)),
                      child: Column(
                        mainAxisAlignment:
                        MainAxisAlignment.spaceEvenly,
                        children: [
                          Row(
                            mainAxisAlignment:
                            MainAxisAlignment
                                .spaceBetween,
                            children: [
                              const Text(
                                'Confirmation',
                                style: TextStyle(
                                    fontWeight:
                                    FontWeight.bold,
                                    color: Colors.red),
                              ),
                              InkWell(
                                  onTap: () {
                                    Navigator.pop(context);
                                  },
                                  child:
                                  const Icon(Icons.close))
                            ],
                          ),
                          Row(
                            mainAxisAlignment:
                            MainAxisAlignment
                                .spaceBetween,
                            children: [
                              const Text(
                                'Entry',
                                style: TextStyle(
                                    fontWeight:
                                    FontWeight.bold),
                              ),
                              // Text(
                              //   'Rs.${widget.contestModel.entry}',
                              //   style: const TextStyle(
                              //       color: Colors.red),
                              // ),
                            ],
                          ),
                          const Row(
                            mainAxisAlignment:
                            MainAxisAlignment
                                .spaceBetween,
                            children: [
                              Text(
                                  'Cash Bonus',
                                  style: TextStyle(
                                      fontWeight:
                                      FontWeight.bold)),
                              Text(
                                '-Rs.0',
                                style: TextStyle(
                                    color: Colors.red
                                ),
                              ),
                            ],
                          ),
                          Divider(
                            indent: heights / 30,
                            endIndent: heights / 30,
                            color: Colors.black26,
                          ),
                          Row(
                            mainAxisAlignment:
                            MainAxisAlignment
                                .spaceBetween,
                            children: [
                              const Text('To Pay',
                                  style: TextStyle(
                                      fontWeight:
                                      FontWeight.bold)),
                              // Text(
                              //   'Rs.${widget.contestModel.entry}',
                              //   style: const TextStyle(
                              //       color: Colors.red),
                              // ),
                            ],
                          ),
                          InkWell(
                            onTap: () {
                              // joinContest();
                            },
                            child: Container(
                              height: heights / 20,
                              width: widths / 2,
                              decoration: BoxDecoration(
                                  color: Colors.red,
                                  borderRadius:
                                  BorderRadius.circular(
                                      10)),
                              child: const Center(
                                child: Text(
                                  'Join Contest',
                                  style: TextStyle(
                                      fontWeight:
                                      FontWeight.bold,
                                      color: Colors.white),
                                ),
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                  ));
            },
            child: Container(
              decoration: BoxDecoration(
                color: Colors.green,
                borderRadius: BorderRadius.circular(5)
              ),
              width: 60,
            height: 40,
              alignment: Alignment.center,
              child: const Text("Join", style: TextStyle(
                fontSize: 18,color: Colors.white, fontWeight: FontWeight.w600
              ),),
            ),
          ),
        ),
      ),
      body: isLoading
          ? const Center(
          child: CircularProgressIndicator(
            color: Colors.deepOrange,
          ))
          : saveTeamList.isEmpty
          ? SizedBox(
        height: heights / 1.9,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            const Text(
              'You have not created team yet',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            Image(
              image: const AssetImage(assetsImagesCircledart),
              height: heights / 2.65,
              width: widths / 0.5,
            ),
            const Text(
              'What Are you waiting for?',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
          ],
        ),
      )
          : ListView.builder(
        padding: const EdgeInsets.only(bottom: 80),
          shrinkWrap: true,
          itemCount: saveTeamList.length,
          itemBuilder: (BuildContext context, int index) {
            return InkWell(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => UpCoMyTeamsPreview(
                          myMatchModel: widget.data,
                          saveTeamModel: saveTeamList[index],
                        )));
              },
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  children: [
                    Container(
                      width: widths/1.2,
                      height: heights / 4.3,
                      decoration: BoxDecoration(
                          image: const DecorationImage(
                              image: AssetImage(Assets.imagesFieldgrass),
                              fit: BoxFit.cover),
                          border: Border.all(color: Colors.black26),
                          borderRadius: BorderRadius.circular(10)),
                      child: Column(
                        // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            height: heights / 19,
                            width: widths / 1,
                            decoration: BoxDecoration(
                                color: Colors.black54,
                                borderRadius: BorderRadius.circular(5)),
                            child: Padding(
                              padding: EdgeInsets.only(
                                  right: heights / 45, left: heights / 45),
                              child: Row(
                                children: [
                                  Text('${saveTeamList[index].teamNumber}',
                                      style: TextStyle(
                                          fontSize: heights / 50,
                                          color: Colors.white,
                                          fontWeight: FontWeight.bold)),
                                  const Spacer(),

                                ],
                              ),
                            ),
                          ),
                          SizedBox(
                            height: heights / 60,
                          ),
                          Padding(
                            padding: EdgeInsets.only(
                                left: heights / 35, right: widths / 30),
                            child: Row(
                              mainAxisAlignment:
                              MainAxisAlignment.spaceBetween,
                              children: [
                                Column(
                                  children: [
                                    Text(
                                      saveTeamList[index].team1!.isEmpty
                                          ? ''
                                          : '${saveTeamList[index].team1![0].teamShortName}',
                                      style: TextStyle(
                                          fontSize: heights / 60,
                                          color: Colors.white,
                                          fontWeight: FontWeight.bold),
                                    ),
                                    Text(
                                      saveTeamList[index].team1!.isEmpty
                                          ? ''
                                          : '${saveTeamList[index].team1![0].teamCount}',
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontSize: heights / 60),
                                    ),
                                  ],
                                ),
                                Column(
                                  children: [
                                    Text(
                                      saveTeamList[index].team2!.isEmpty
                                          ? ''
                                          : '${saveTeamList[index].team2![0].teamShortName}',
                                      style: TextStyle(
                                          fontSize: heights / 60,
                                          color: Colors.white,
                                          fontWeight: FontWeight.bold),
                                    ),
                                    Text(
                                      saveTeamList[index].team2!.isEmpty
                                          ? ''
                                          : '${saveTeamList[index].team2![0].teamCount}',
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontSize: heights / 60),
                                    ),
                                  ],
                                ),
                                Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Container(
                                      height: heights / 40.5,
                                      width: widths / 18,
                                      decoration: BoxDecoration(
                                          color: Colors.black,
                                          borderRadius:
                                          BorderRadius.circular(50),
                                          border:
                                          Border.all(color: Colors.white)),
                                      child: Center(
                                          child: Text(
                                            'C',
                                            style: TextStyle(
                                                fontSize: heights / 70,
                                                color: Colors.white),
                                          )),
                                    ),
                                    Column(
                                      children: [
                                        Container(
                                            height: 60,
                                            width: 60,
                                            decoration: BoxDecoration(
                                                borderRadius:
                                                BorderRadius.circular(50),
                                                color: Colors.white,
                                                image: DecorationImage(
                                                  image: NetworkImage(
                                                      '${saveTeamList[index].captainImage}'),
                                                ))),
                                        Container(
                                          height: heights / 60,
                                          width: widths / 10,
                                          decoration: const BoxDecoration(
                                            color: Colors.black,
                                          ),
                                          child: Center(
                                              child: Text(
                                                '${saveTeamList[index].captain}',
                                                style: TextStyle(
                                                    color: Colors.white,
                                                    fontSize: heights / 80),
                                              )),
                                        )
                                      ],
                                    ),
                                  ],
                                ),

                                Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Container(
                                      height: heights / 40.5,
                                      width: widths / 18,
                                      decoration: BoxDecoration(
                                          color: Colors.white,
                                          borderRadius:
                                          BorderRadius.circular(50)),
                                      child: Center(
                                          child: Text(
                                            'VC',
                                            style:
                                            TextStyle(fontSize: heights / 70),
                                          )),
                                    ),
                                    Column(
                                      children: [
                                        Container(
                                            height: 60,
                                            width: 60,
                                            decoration: BoxDecoration(
                                                borderRadius:
                                                BorderRadius.circular(50),
                                                color: Colors.white,
                                                image: DecorationImage(
                                                  image: NetworkImage(
                                                      '${saveTeamList[index].viceCaptainImage}'),
                                                ))),
                                        Container(
                                          height: heights / 60,
                                          width: widths / 8,
                                          decoration: const BoxDecoration(
                                            color: Colors.white,
                                          ),
                                          child: Center(
                                              child: Text(
                                                '${saveTeamList[index].viceCaptain}',
                                                style: TextStyle(
                                                    color: Colors.black,
                                                    fontSize: heights / 80),
                                              )),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                          Padding(
                            padding:
                            const EdgeInsets.fromLTRB(15, 10, 15, 5),
                            child: Row(
                              mainAxisAlignment:
                              MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  "WK  ${saveTeamList[index].wicketKeeper}",
                                  style: const TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.w600,
                                      fontSize: 14),
                                ),
                                Text("BAT  ${saveTeamList[index].batsman}",
                                    style: const TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.w600,
                                        fontSize: 14)),
                                Text(
                                    "AR  ${saveTeamList[index].allRounder}",
                                    style: const TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.w600,
                                        fontSize: 14)),
                                Text("BOWL  ${saveTeamList[index].bowler}",
                                    style: const TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.w600,
                                        fontSize: 14)),
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                    Checkbox(
                      value: isSelected[index],
                      onChanged: (value) {
                        setState(() {
                          selectedTeamName= saveTeamList[index].teamNumber;
                          isSelected[index] = value!;
                        });
                      },
                    ),
                  ],
                ),
              ),
            );
          }),
    );
  }

  @override
  void initState() {
    super.initState();
    getSaveTeam();
    // isSelected = List<bool>.filled(saveTeamList.length, false);
  }

  List<SaveTeamModel> saveTeamList = [];
  bool isLoading = true;
  Future<void> getSaveTeam() async {
    final prefs = await SharedPreferences.getInstance();
    final userid = prefs.getString("userid");
    final matchid = widget.data.matchId;
    try {
      final response = await http.post(Uri.parse(ApiUrl.myTeamList),
          headers: <String, String>{
            'content-Type': 'application/json; charset=UTF-8',
          },
          body: jsonEncode(<String, String>{
            "user_id": '$userid',
            "match_id": matchid.toString()
          }));
      final responseData = jsonDecode(response.body);
      if (responseData['responsecode'] == '200') {
        List<dynamic> data = json.decode(response.body)['data'];

        saveTeamList.clear();

        for (var saveData in data) {
          saveTeamList.add(SaveTeamModel.fromJson(saveData));
        }
        isSelected = List<bool>.filled(saveTeamList.length, false);
      } else {
        if (kDebugMode) {
          print('Failed to load data');
        }
      }
    } catch (e) {
      if (kDebugMode) {
        print('Error fetching data: $e');
      }
    } finally {
      setState(() {
        isLoading = false;
      });
    }
  }
}
