// ignore_for_file: depend_on_referenced_packages

import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:dream11_pw/Constant/api_url.dart';
import 'package:dream11_pw/Model/player_list_model.dart';
import 'package:dream11_pw/Model/save_team_model.dart';
import 'package:dream11_pw/Model/cricket_matches_model.dart';
import 'package:dream11_pw/Winner/player_profile.dart';
import '../../../../zTeamPreview.dart';
import 'continue_page.dart';
import 'package:step_progress_indicator/step_progress_indicator.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:http/http.dart' as http;

class CreateTeamTapBarPage extends StatefulWidget {
  final CricketMatchesModel match;
  final SaveTeamModel? saveTeamModel;

  const CreateTeamTapBarPage(
      {super.key, required this.match, this.saveTeamModel});

  @override
  State<CreateTeamTapBarPage> createState() => _CreateTeamTapBarPageState();
}

class _CreateTeamTapBarPageState extends State<CreateTeamTapBarPage> {
  @override
  void initState() {
    getTeamsPlayersList();
    super.initState();
  }

  List<PlayerListModel> allPlayers = [];
  List<PlayerListModel> selectedPlayers = [];

  int wkCount = 0;
  int bowlerCount = 0;
  int batsmenCount = 0;
  int allRounderCount = 0;
  double cPoints = 0;
  int total = 0;

  void showToast(String msg) {
    Fluttertoast.showToast(
        msg: msg,
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
        backgroundColor: Colors.red,
        textColor: Colors.black);
  }

  @override
  Widget build(BuildContext context) {
    final heights = MediaQuery.of(context).size.height;
    final widths = MediaQuery.of(context).size.width;
    return DefaultTabController(
      length: 4,
      child: Scaffold(
        appBar: AppBar(
          elevation: 0,
          automaticallyImplyLeading: false,
          leading: IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: const Icon(Icons.arrow_back)),
          title: Text(
              '${widget.match.teamShortName1!} vs ${widget.match.teamShortName2!}'),
          backgroundColor: Colors.red,
        ),
        bottomSheet: SizedBox(
          height: heights / 15,
          child: Padding(
            padding:
                EdgeInsets.fromLTRB(widths / 12, 0, widths / 12, heights / 60),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                InkWell(
                  onTap: () {
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => Team_preview(
                              team: selectedPlayers,
                              match: widget.match,
                            )));
                  },
                  child: Container(
                    // height: heights/5,
                    width: widths / 2.7,
                    decoration: BoxDecoration(
                        // color: Colors.blue,
                        border: Border.all(color: Colors.red, width: 2),
                        borderRadius: BorderRadius.circular(10)),
                    child: const Center(
                        child: Text(
                      'Preview',
                      style: TextStyle(color: Colors.red),
                    )),
                  ),
                ),
                InkWell(
                  onTap: () {
                    if (wkCount <= 0) {
                      showToast('At-least 1 Wicketkeeper should be selected');
                    } else if (batsmenCount <= 0) {
                      showToast('At-least 1 Batsman should be selected');
                    } else if (allRounderCount <= 0) {
                      showToast('At-least 1 AllRounder should be selected');
                    } else if (bowlerCount <= 0) {
                      showToast('At-least 1 Bowler should be selected');
                    } else if (total != 11) {
                      showToast('Please Select 11 Players');
                    } else {
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => SaveTeam(
                              team: selectedPlayers, match: widget.match)));
                    }
                  },
                  child: Container(
                    width: widths / 2.7,
                    decoration: BoxDecoration(
                        color: Colors.red,
                        borderRadius: BorderRadius.circular(10)),
                    child: const Center(
                        child: Text(
                      'Continue',
                      style: TextStyle(color: Colors.white),
                    )),
                  ),
                ),
              ],
            ),
          ),
        ),
        body: Column(
          children: [
            Container(
              color: Colors.red,
              child: Column(children: <Widget>[
                Container(
                    color: Colors.red,
                    padding: const EdgeInsets.all(5),
                    child: Text(
                      'Start time : ${widget.match.matchDateTime}'
                          .split('.')
                          .first,
                      style: const TextStyle(
                        color: Colors.white,
                      ),
                    )),
                Container(
                    padding: const EdgeInsets.all(5),
                    child: Row(children: <Widget>[
                      Column(
                          mainAxisSize: MainAxisSize.min,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Text(
                              'Players',
                              style: TextStyle(fontSize: heights / 55),
                            ),
                            Text(
                              '$total/11',
                              style: TextStyle(
                                fontSize: heights / 60,
                              ),
                            ),
                          ]),
                      Expanded(
                          child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          CircleAvatar(
                            backgroundColor: Colors.white,
                            radius: heights / 40,
                            backgroundImage: NetworkImage(
                              '${widget.match.teamImage1}',
                              // 'images/${widget.team1}.jpg'
                            ),
                          ),
                          const Text('  VS  ', style: TextStyle()),
                          CircleAvatar(
                            backgroundColor: Colors.white,
                            radius: heights / 40,
                            backgroundImage: NetworkImage(
                              '${widget.match.teamImage2}',
                            ),
                          ),
                        ],
                      )),
                      Column(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: <Widget>[
                            Text(
                              'Credits left',
                              style: TextStyle(fontSize: heights / 55),
                            ),
                            Text(
                              (100 - cPoints).toString(),
                              style: TextStyle(fontSize: heights / 60),
                            ),
                          ]),
                    ])),
                SizedBox(height: heights / 90),
                Container(
                  padding: const EdgeInsets.fromLTRB(20, 10, 20, 10),
                  child: StepProgressIndicator(
                    totalSteps: 11,
                    currentStep: selectedPlayers.length,
                    size: 10,
                    selectedColor: Colors.green,
                    unselectedColor: (Colors.grey[300])!,
                  ),
                ),
                Container(
                  height: heights / 65,
                  width: widths,
                  padding: const EdgeInsets.all(5),
                )
              ]),
            ),
            TabBar(
              indicatorColor: Colors.red,
              labelColor: Colors.red,
              unselectedLabelColor: Colors.red,
              tabs: [
                Tab(text: "WK($wkCount)"),
                Tab(text: "BAT($batsmenCount)"),
                Tab(text: "AR($allRounderCount)"),
                Tab(text: "BOWL($bowlerCount)"),
              ],
            ),
            SizedBox(
              height: heights / 1.5,
              width: widths,
              child: TabBarView(children: [
                ListView(
                  children: [
                    Container(
                      height: heights / 20,
                      width: widths,
                      color: Colors.grey[200],
                      child: Center(
                          child: Text(
                        'Pick 1-8 Wicket Keeper',
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: heights / 55),
                      )),
                    ),
                    SizedBox(
                      height: heights / 25,
                      width: widths,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          const Text(
                            'Players',
                            style: TextStyle(
                                color: Colors.grey,
                                fontWeight: FontWeight.bold),
                          ),
                          SizedBox(
                            width: widths / 15,
                          ),
                          const Text(
                            'Points',
                            style: TextStyle(
                                color: Colors.grey,
                                fontWeight: FontWeight.bold),
                          ),
                          const Text(
                            'Credits',
                            style: TextStyle(fontWeight: FontWeight.bold),
                          )
                        ],
                      ),
                    ),
                    for (var data in allPlayers)
                      if (data.designationId == '4')
                        Container(
                          height: heights / 13,
                          width: widths,
                          decoration: const BoxDecoration(
                              border: Border(
                                  top: BorderSide(
                                      width: 1, color: Colors.black12),
                                  bottom: BorderSide(
                                      width: 1, color: Colors.black12))),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              InkWell(
                                onTap: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => playerprofile(
                                                bowldata: data,
                                              )));
                                },
                                child: Padding(
                                  padding: EdgeInsets.only(left: heights / 70),
                                  child: CircleAvatar(
                                    backgroundImage:
                                        NetworkImage('${data.image}'),
                                    backgroundColor: Colors.white,
                                    radius: 20,
                                  ),
                                ),
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  SizedBox(
                                      width: 70,
                                      child: Text(
                                        '${data.name}',
                                        style: TextStyle(
                                            fontSize: heights / 70,
                                            fontWeight:
                                            FontWeight.bold),
                                      )),
                                  // Text(
                                  //   '${data.name}',
                                  //   style: TextStyle(
                                  //       fontSize: heights / 70,
                                  //       fontWeight: FontWeight.bold),
                                  // ),
                                  Text(
                                    'Wicket Keeper',
                                    style: TextStyle(
                                        color: Colors.grey,
                                        fontSize: heights / 90),
                                  ),
                                  Row(
                                    children: [
                                      const Icon(
                                        Icons.fiber_manual_record_rounded,
                                        size: 7,
                                        color: Colors.green,
                                      ),
                                      SizedBox(
                                        width: widths / 90,
                                      ),
                                      Text(
                                        'Playing',
                                        style: TextStyle(
                                            color: Colors.green,
                                            fontSize: heights / 95,
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                              SizedBox(
                                width: widths / 4,
                              ),
                              const Text('0.0'),
                              SizedBox(
                                width: widths / 12,
                              ),
                              Text(
                                '${data.creditPoints}',
                                style: const TextStyle(
                                    fontWeight: FontWeight.bold),
                              ),
                              // SizedBox(width: widths/70,),
                              const VerticalDivider(
                                endIndent: 10,
                                indent: 7,
                                color: Colors.grey,
                              ),
                              IconButton(
                                  onPressed: () {
                                    var result = selectedPlayers
                                        .where((food) => food.name!
                                            .toUpperCase()
                                            .contains(data.name!.toUpperCase()))
                                        .toList();
                                    if (cPoints < 93 && result.length <= 0) {
                                      if (total < 11) {
                                        selectedPlayers.add(PlayerListModel(
                                          id: data.id,
                                          pid: data.pid,
                                          name: data.name,
                                          designationId: data.designationId,
                                          teamId: data.teamId,
                                          playingStatus: data.playingStatus,
                                          creditPoints: data.creditPoints,
                                          points: data.points,
                                          image: data.image,
                                          dob: data.dob,
                                          nationality: data.nationality,
                                          bowls: data.bowls.toString(),
                                          bats: data.bats.toString(),
                                          teamName: data.teamName.toString(),
                                          createdDate: data.createdDate,
                                          modifiedDate: data.modifiedDate,
                                        ));
                                        setState(() {
                                          total = total + 1;
                                          wkCount = wkCount + 1;
                                        });
                                      }
                                    } else {
                                      if (total <= 11 && result.length > 0) {
                                      selectedPlayers.removeWhere(
                                          (item) => item.pid == (data.pid));

                                        setState(() {
                                          total = total - 1;
                                          wkCount = wkCount - 1;
                                        });
                                      }
                                    }

                                    credit();
                                  },
                                  icon: Icon(
                                    selectedPlayers
                                                .where((food) => food.name!
                                                    .toUpperCase()
                                                    .contains(data.name!
                                                        .toUpperCase()))
                                                .toList()
                                                .length <=
                                            0
                                        ? Icons.add
                                        : Icons.remove,
                                    color: selectedPlayers
                                                .where((food) => food.name!
                                                    .toUpperCase()
                                                    .contains(data.name!
                                                        .toUpperCase()))
                                                .toList()
                                                .length <=
                                            0
                                        ? Colors.green
                                        : Colors.red,
                                  )),
                            ],
                          ),
                        ),
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.08,
                    )
                  ],
                ),
                ListView(
                  children: [
                    Container(
                      height: heights / 20,
                      width: widths,
                      color: Colors.grey[200],
                      child: Center(
                          child: Text(
                        'Pick 1-8 Batsmen Keeper',
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: heights / 55),
                      )),
                    ),
                    SizedBox(
                      height: heights / 25,
                      width: widths,
                      // color: Colors.blue,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          const Text(
                            'Players',
                            style: TextStyle(
                                color: Colors.grey,
                                fontWeight: FontWeight.bold),
                          ),
                          SizedBox(
                            width: widths / 15,
                          ),
                          const Text(
                            'Points',
                            style: TextStyle(
                                color: Colors.grey,
                                fontWeight: FontWeight.bold),
                          ),
                          // SizedBox(width:2,),
                          const Text(
                            'Credits',
                            style: TextStyle(fontWeight: FontWeight.bold),
                          )
                        ],
                      ),
                    ),
                    for (var data in allPlayers)
                      if (data.designationId == '1')
                        Container(
                          height: heights / 13,
                          width: widths,
                          decoration: const BoxDecoration(
                              border: Border(
                                  top: BorderSide(
                                      width: 1, color: Colors.black12),
                                  bottom: BorderSide(
                                      width: 1, color: Colors.black12))),
                          // color: Colors.blue,
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              InkWell(
                                onTap: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => playerprofile(
                                                bowldata: data,
                                              )));
                                },
                                child: Padding(
                                  padding: EdgeInsets.only(left: heights / 70),
                                  child: CircleAvatar(
                                    backgroundImage:
                                        NetworkImage('${data.image}'),
                                    backgroundColor: Colors.white,
                                    radius: 20,
                                  ),
                                ),
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  SizedBox(
                                      width: 70,
                                      child: Text(
                                        '${data.name}',
                                        style: TextStyle(
                                            fontSize: heights / 70,
                                            fontWeight:
                                            FontWeight.bold),
                                      )),
                                  // Text(
                                  //   '${data.name}',
                                  //   style: TextStyle(
                                  //       fontSize: heights / 70,
                                  //       fontWeight: FontWeight.bold),
                                  // ),
                                  Text(
                                    'Batsman',
                                    style: TextStyle(
                                        color: Colors.grey,
                                        fontSize: heights / 90),
                                  ),
                                  Row(
                                    children: [
                                      const Icon(
                                        Icons.fiber_manual_record_rounded,
                                        size: 7,
                                        color: Colors.green,
                                      ),
                                      SizedBox(
                                        width: widths / 90,
                                      ),
                                      Text(
                                        'Playing',
                                        style: TextStyle(
                                            color: Colors.green,
                                            fontSize: heights / 95,
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                              SizedBox(
                                width: widths / 4,
                              ),
                              const Text('0.0'),
                              SizedBox(
                                width: widths / 12,
                              ),
                              Text(
                                '${data.creditPoints}',
                                style: const TextStyle(
                                    fontWeight: FontWeight.bold),
                              ),
                              // SizedBox(width: widths/70,),
                              const VerticalDivider(
                                endIndent: 10,
                                indent: 7,
                                color: Colors.grey,
                              ),
                              IconButton(
                                  onPressed: () {
                                    var result = selectedPlayers
                                        .where((food) => food.name!
                                            .toUpperCase()
                                            .contains(data.name!.toUpperCase()))
                                        .toList();

                                    if (cPoints < 93 && result.length <= 0) {
                                      if (total < 11) {
                                        selectedPlayers.add(PlayerListModel(
                                          id: data.id,
                                          pid: data.pid,
                                          name: data.name,
                                          designationId: data.designationId,
                                          teamId: data.teamId,
                                          playingStatus: data.playingStatus,
                                          creditPoints: data.creditPoints,
                                          points: data.points,
                                          image: data.image,
                                          dob: data.dob,
                                          nationality: data.nationality,
                                          bowls: data.bowls.toString(),
                                          bats: data.bats.toString(),
                                          teamName: data.teamName.toString(),
                                          createdDate: data.createdDate,
                                          modifiedDate: data.modifiedDate,
                                        ));
                                        setState(() {
                                          total = total + 1;
                                          batsmenCount = batsmenCount + 1;
                                        });
                                      }
                                    } else {
                                      if (total <= 11 && result.length > 0) {
                                      selectedPlayers.removeWhere(
                                          (item) => item.pid == (data.pid));

                                        setState(() {
                                          total = total - 1;
                                          batsmenCount = batsmenCount - 1;
                                        });
                                      }
                                    }

                                    credit();
                                  },
                                  icon: Icon(
                                    selectedPlayers
                                                .where((food) => food.name!
                                                    .toUpperCase()
                                                    .contains(data.name!
                                                        .toUpperCase()))
                                                .toList()
                                                .length <=
                                            0
                                        ? Icons.add
                                        : Icons.remove,
                                    color: selectedPlayers
                                                .where((food) => food.name!
                                                    .toUpperCase()
                                                    .contains(data.name!
                                                        .toUpperCase()))
                                                .toList()
                                                .length <=
                                            0
                                        ? Colors.green
                                        : Colors.red,
                                  )),
                            ],
                          ),
                        ),
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.08,
                    )
                  ],
                ),
                ListView(
                  children: [
                    Container(
                      height: heights / 20,
                      width: widths,
                      color: Colors.grey[200],
                      child: Center(
                          child: Text(
                        'Pick 1-8 Wicket Keeper',
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: heights / 55),
                      )),
                    ),
                    SizedBox(
                      height: heights / 25,
                      width: widths,
                      // color: Colors.blue,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          const Text(
                            'Players',
                            style: TextStyle(
                                color: Colors.grey,
                                fontWeight: FontWeight.bold),
                          ),
                          SizedBox(
                            width: widths / 15,
                          ),
                          const Text(
                            'Points',
                            style: TextStyle(
                                color: Colors.grey,
                                fontWeight: FontWeight.bold),
                          ),
                          // SizedBox(width:2,),
                          const Text(
                            'Credits',
                            style: TextStyle(fontWeight: FontWeight.bold),
                          )
                        ],
                      ),
                    ),
                    for (var data in allPlayers)
                      if (data.designationId == '3')
                        Container(
                          height: heights / 13,
                          width: widths,
                          decoration: const BoxDecoration(
                              border: Border(
                                  top: BorderSide(
                                      width: 1, color: Colors.black12),
                                  bottom: BorderSide(
                                      width: 1, color: Colors.black12))),
                          // color: Colors.blue,
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              InkWell(
                                onTap: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => playerprofile(
                                                bowldata: data,
                                              )));
                                },
                                child: Padding(
                                  padding: EdgeInsets.only(left: heights / 70),
                                  child: CircleAvatar(
                                    backgroundImage:
                                        NetworkImage('${data.image}'),
                                    backgroundColor: Colors.white,
                                    radius: 20,
                                  ),
                                ),
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  SizedBox(
                                      width: 70,
                                      child: Text(
                                        '${data.name}',
                                        style: TextStyle(
                                            fontSize: heights / 70,
                                            fontWeight:
                                            FontWeight.bold),
                                      )),
                                  // Text(
                                  //   '${data.name}',
                                  //   style: TextStyle(
                                  //       fontSize: heights / 70,
                                  //       fontWeight: FontWeight.bold),
                                  // ),
                                  Text(
                                    'All Rounder',
                                    style: TextStyle(
                                        color: Colors.grey,
                                        fontSize: heights / 90),
                                  ),
                                  Row(
                                    children: [
                                      const Icon(
                                        Icons.fiber_manual_record_rounded,
                                        size: 7,
                                        color: Colors.green,
                                      ),
                                      SizedBox(
                                        width: widths / 90,
                                      ),
                                      Text(
                                        'Playing',
                                        style: TextStyle(
                                            color: Colors.green,
                                            fontSize: heights / 95,
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                              SizedBox(
                                width: widths / 4,
                              ),
                              const Text('0.0'),
                              SizedBox(
                                width: widths / 12,
                              ),
                              Text(
                                '${data.creditPoints}',
                                style: const TextStyle(
                                    fontWeight: FontWeight.bold),
                              ),
                              // SizedBox(width: widths/70,),
                              const VerticalDivider(
                                endIndent: 10,
                                indent: 7,
                                color: Colors.grey,
                              ),
                              IconButton(
                                  onPressed: () {
                                    var result = selectedPlayers
                                        .where((food) => food.name!
                                            .toUpperCase()
                                            .contains(data.name!.toUpperCase()))
                                        .toList();

                                    if (cPoints < 93 && result.length <= 0) {
                                      if (total < 11) {
                                        selectedPlayers.add(PlayerListModel(
                                          id: data.id,
                                          pid: data.pid,
                                          name: data.name,
                                          designationId: data.designationId,
                                          teamId: data.teamId,
                                          playingStatus: data.playingStatus,
                                          creditPoints: data.creditPoints,
                                          points: data.points,
                                          image: data.image,
                                          dob: data.dob,
                                          nationality: data.nationality,
                                          bowls: data.bowls.toString(),
                                          bats: data.bats.toString(),
                                          teamName: data.teamName.toString(),
                                          createdDate: data.createdDate,
                                          modifiedDate: data.modifiedDate,
                                        ));
                                        setState(() {
                                          total = total + 1;
                                          allRounderCount = allRounderCount + 1;
                                        });
                                      }
                                    } else {
                                      if (total <= 11 && result.length > 0) {
                                      selectedPlayers.removeWhere(
                                          (item) => item.pid == (data.pid));
                                        setState(() {
                                          total = total - 1;
                                          allRounderCount = allRounderCount - 1;
                                        });
                                      }
                                    }

                                    credit();
                                  },
                                  icon: Icon(
                                    selectedPlayers
                                                .where((food) => food.name!
                                                    .toUpperCase()
                                                    .contains(data.name!
                                                        .toUpperCase()))
                                                .toList()
                                                .length <=
                                            0
                                        ? Icons.add
                                        : Icons.remove,
                                    color: selectedPlayers
                                                .where((food) => food.name!
                                                    .toUpperCase()
                                                    .contains(data.name!
                                                        .toUpperCase()))
                                                .toList()
                                                .length <=
                                            0
                                        ? Colors.green
                                        : Colors.red,
                                  )),
                            ],
                          ),
                        ),
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.08,
                    )
                  ],
                ),
                ListView(
                  children: [
                    Container(
                      height: heights / 20,
                      width: widths,
                      color: Colors.grey[200],
                      child: Center(
                          child: Text(
                        'Pick 1-8 Wicket Keeper',
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: heights / 55),
                      )),
                    ),
                    SizedBox(
                      height: heights / 25,
                      width: widths,
                      // color: Colors.blue,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          const Text(
                            'Players',
                            style: TextStyle(
                                color: Colors.grey,
                                fontWeight: FontWeight.bold),
                          ),
                          SizedBox(
                            width: widths / 15,
                          ),
                          const Text(
                            'Points',
                            style: TextStyle(
                                color: Colors.grey,
                                fontWeight: FontWeight.bold),
                          ),
                          // SizedBox(width:2,),
                          const Text(
                            'Credits',
                            style: TextStyle(fontWeight: FontWeight.bold),
                          )
                        ],
                      ),
                    ),
                    for (var data in allPlayers)
                      if (data.designationId == '2')
                        Container(
                          height: heights / 13,
                          width: widths,
                          decoration: const BoxDecoration(
                              border: Border(
                                  top: BorderSide(
                                      width: 1, color: Colors.black12),
                                  bottom: BorderSide(
                                      width: 1, color: Colors.black12))),
                          // color: Colors.blue,
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              InkWell(
                                onTap: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => playerprofile(
                                                bowldata: data,
                                              )));
                                },
                                child: Padding(
                                  padding: EdgeInsets.only(left: heights / 70),
                                  child: CircleAvatar(
                                    backgroundImage:
                                        NetworkImage('${data.image}'),
                                    backgroundColor: Colors.white,
                                    radius: 20,
                                  ),
                                ),
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  SizedBox(
                                      width: 70,
                                      child: Text(
                                        '${data.name}',
                                        style: TextStyle(
                                            fontSize: heights / 70,
                                            fontWeight:
                                            FontWeight.bold),
                                      )),
                                  // Text(
                                  //   '${data.name}',
                                  //   style: TextStyle(
                                  //       fontSize: heights / 70,
                                  //       fontWeight: FontWeight.bold),
                                  // ),
                                  Text(
                                    'Bowler',
                                    style: TextStyle(
                                        color: Colors.grey,
                                        fontSize: heights / 90),
                                  ),
                                  Row(
                                    children: [
                                      const Icon(
                                        Icons.fiber_manual_record_rounded,
                                        size: 7,
                                        color: Colors.green,
                                      ),
                                      SizedBox(
                                        width: widths / 90,
                                      ),
                                      Text(
                                        'Playing',
                                        style: TextStyle(
                                            color: Colors.green,
                                            fontSize: heights / 95,
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                              SizedBox(
                                width: widths / 4,
                              ),
                              const Text('0.0'),
                              SizedBox(
                                width: widths / 12,
                              ),
                              Text(
                                '${data.creditPoints}',
                                style: const TextStyle(
                                    fontWeight: FontWeight.bold),
                              ),
                              // SizedBox(width: widths/70,),
                              const VerticalDivider(
                                endIndent: 10,
                                indent: 7,
                                color: Colors.grey,
                              ),
                              IconButton(
                                  onPressed: () {
                                    var result = selectedPlayers
                                        .where((food) => food.name!
                                            .toUpperCase()
                                            .contains(data.name!.toUpperCase()))
                                        .toList();
                                    if (cPoints < 93 && result.length <= 0) {
                                      if (total < 11) {
                                        selectedPlayers.add(PlayerListModel(
                                          id: data.id,
                                          pid: data.pid,
                                          name: data.name,
                                          designationId: data.designationId,
                                          teamId: data.teamId,
                                          playingStatus: data.playingStatus,
                                          creditPoints: data.creditPoints,
                                          points: data.points,
                                          image: data.image,
                                          dob: data.dob,
                                          nationality: data.nationality,
                                          bowls: data.bowls.toString(),
                                          bats: data.bats.toString(),
                                          teamName: data.teamName.toString(),
                                          createdDate: data.createdDate,
                                          modifiedDate: data.modifiedDate,
                                        ));
                                        setState(() {
                                          total = total + 1;
                                          bowlerCount = bowlerCount + 1;
                                        });
                                      }
                                    } else {
                                      if (total <= 11 && result.length > 0) {

                                        selectedPlayers.removeWhere(
                                          (item) => item.pid == (data.pid));
                                        setState(() {
                                          total = total - 1;
                                          bowlerCount = bowlerCount - 1;
                                        });
                                      }
                                    }

                                    credit();
                                  },
                                  icon: Icon(
                                    selectedPlayers
                                                .where((food) => food.name!
                                                    .toUpperCase()
                                                    .contains(data.name!
                                                        .toUpperCase()))
                                                .toList()
                                                .length <=
                                            0
                                        ? Icons.add
                                        : Icons.remove,
                                    color: selectedPlayers
                                                .where((food) => food.name!
                                                    .toUpperCase()
                                                    .contains(data.name!
                                                        .toUpperCase()))
                                                .toList()
                                                .length <=
                                            0
                                        ? Colors.green
                                        : Colors.red,
                                  )),
                            ],
                          ),
                        ),
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.08,
                    )
                  ],
                ),
              ]),
            ),
          ],
        ),
      ),
    );
  }

  bool isLoading = false;
  credit() {
    setState(() {
      cPoints = 0;
    });
    for (int i = 0; i < selectedPlayers.length; i++) {
      double points = double.parse('${selectedPlayers[i].creditPoints}');
      setState(() {
        cPoints = points + cPoints;
      });
    }
  }

  Future<void> getTeamsPlayersList() async {
    allPlayers.clear();
    selectedPlayers.clear();
    try {
      final response = await http.post(Uri.parse(ApiUrl.playerLists),
          headers: <String, String>{
            'content-Type': 'application/json; charset=UTF-8',
          },
          body: jsonEncode(<String, String>{
            "team1id": '${widget.match.teamId1}',
            "team2id": '${widget.match.teamId2}'
          }));

      if (response.statusCode == 200) {
        List jsonData = json.decode(response.body)['data'];
        for (var json in jsonData) {
          PlayerListModel player = PlayerListModel.fromJson(json);
          allPlayers.add(player);
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
        isLoading =
            false; // Update loading state regardless of success or failure
      });
    }

    if (widget.saveTeamModel!.playerInfo!.isEmpty) {
    } else {
      setState(() {
        wkCount = widget.saveTeamModel!.wicketKeeper!;
        bowlerCount = widget.saveTeamModel!.bowler!;
        batsmenCount = widget.saveTeamModel!.batsman!;
        allRounderCount = widget.saveTeamModel!.allRounder!;
        total = 11;
      });

      for (var viewplayer in widget.saveTeamModel!.playerInfo!) {
        selectedPlayers.add(PlayerListModel(
          id: viewplayer.id,
          pid: viewplayer.pid,
          name: viewplayer.name,
          designationId: viewplayer.designationId,
          teamId: viewplayer.teamId,
          playingStatus: viewplayer.playingStatus,
          creditPoints: viewplayer.creditPoints,
          points: viewplayer.points,
          image: viewplayer.image,
          dob: viewplayer.dob.toString(),
          nationality: viewplayer.nationality,
          bowls: viewplayer.bowls.toString(),
          bats: viewplayer.bats.toString(),
          teamName: viewplayer.teamShortName,
          createdDate: viewplayer.createdDate,
          modifiedDate: viewplayer.modifiedDate,
        ));
      }
    }
  }
}
