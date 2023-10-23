// ignore_for_file: depend_on_referenced_packages

import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:dream11_pw/generated/assets.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import '../../../../Constant/api_url.dart';
import '../../../../Constant/images.dart';
import '../../../../Model/my_match_model.dart';
import '../../../../Model/save_team_model.dart';
import '../UpCoCreateTeamTab/up_c_create_team_tab_bar.dart';
import '../UpCoMyTeamsView/up_c_my_teams_preview.dart';
import '../up_c_tab_bar.dart';


class UpCoMyTeamsTab extends StatefulWidget {
  final MyMatchModel data;
  const UpCoMyTeamsTab({super.key, required this.data});

  @override
  State<UpCoMyTeamsTab> createState() => _UpCoMyTeamsTabState();
}

class _UpCoMyTeamsTabState extends State<UpCoMyTeamsTab> {
  @override
  Widget build(BuildContext context) {
    final heights = MediaQuery.of(context).size.height;
    final widths = MediaQuery.of(context).size.width;
    return Scaffold(
      bottomSheet: InkWell(
        onTap: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => UpCoCreateTeamTapBarPage(
                        myMatchModel: widget.data,
                      )));
        },
        child: SizedBox(
          height: heights / 17,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                height: heights / 17,
                width: widths / 2,
                decoration: BoxDecoration(
                    color: Colors.red, borderRadius: BorderRadius.circular(10)),
                child: const Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.add,
                      color: Colors.white,
                    ),
                    Text(
                      'Create Team',
                      style: TextStyle(color: Colors.white),
                    ),
                  ],
                ),
              ),
            ],
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
                        child: Container(
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
                                      IconButton(
                                          onPressed: () {
                                            Navigator.push(
                                                context,
                                                MaterialPageRoute(
                                                    builder: (context) =>
                                                        UpCoCreateTeamTapBarPage(
                                                            saveTeamModel:
                                                            saveTeamList[
                                                            index], myMatchModel: widget.data,)));
                                          },
                                          icon: const Icon(
                                            Icons.edit,
                                            size: 20,
                                            color: Colors.white,
                                          )),
                                      IconButton(
                                          onPressed: () {
                                            Navigator.push(
                                                context,
                                                MaterialPageRoute(
                                                    builder: (context) =>
                                                        UpCoTabBar(
                                                            data: widget.data,
                                                            teamId:
                                                            saveTeamList[
                                                            index]
                                                                .id!,
                                                            tabIndex: 0)));
                                          },
                                          icon: const Icon(
                                            Icons.add,
                                            size: 25,
                                            color: Colors.white,
                                          )),
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
                                              fontSize: heights / 40,
                                              color: Colors.white,
                                              fontWeight: FontWeight.bold),
                                        ),
                                        Text(
                                          saveTeamList[index].team1!.isEmpty
                                              ? ''
                                              : '${saveTeamList[index].team1![0].teamCount}',
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontSize: heights / 40),
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
                                              fontSize: heights / 40,
                                              color: Colors.white,
                                              fontWeight: FontWeight.bold),
                                        ),
                                        Text(
                                          saveTeamList[index].team2!.isEmpty
                                              ? ''
                                              : '${saveTeamList[index].team2![0].teamCount}',
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontSize: heights / 40),
                                        ),
                                      ],
                                    ),
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
                                            height: 80,
                                            width: 80,
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
                                            height: 80,
                                            width: 80,
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
                                          )
                                          ),
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
                                          fontSize: 18),
                                    ),
                                    Text("BAT  ${saveTeamList[index].batsman}",
                                        style: const TextStyle(
                                            color: Colors.white,
                                            fontWeight: FontWeight.w600,
                                            fontSize: 18)),
                                    Text(
                                        "AR  ${saveTeamList[index].allRounder}",
                                        style: const TextStyle(
                                            color: Colors.white,
                                            fontWeight: FontWeight.w600,
                                            fontSize: 18)),
                                    Text("BOWL  ${saveTeamList[index].bowler}",
                                        style: const TextStyle(
                                            color: Colors.white,
                                            fontWeight: FontWeight.w600,
                                            fontSize: 18)),
                                  ],
                                ),
                              )
                            ],
                          ),
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
