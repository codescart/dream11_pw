// ignore_for_file: depend_on_referenced_packages

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:step_progress_indicator/step_progress_indicator.dart';
import 'package:dream11_pw/HomePage/PaytmTrophy/ActionButton/CreateTeamTab/create_team_tab_bar.dart';
import 'package:dream11_pw/HomePage/PaytmTrophy/PaytmTrophyTabBar/VsTabBar/countryVsTabPage.dart';
import 'package:dream11_pw/Model/cricket_matches_model.dart';
import 'package:dream11_pw/Constant/api_url.dart';
import 'package:dream11_pw/HomePage/PaytmTrophy/ActionButton/createContestPage.dart';
import 'package:http/http.dart' as http;
import '../../../../Api/Api_controller/walletApi.dart';
import '../../../../Api/api_controller.dart';
import '../../../../DrawerContent/WalletItem/add_cash.dart';
import '../../../../Model/contest_model.dart';
import '../../../../Provider/view_profile_provider.dart';

class ContestTab extends StatefulWidget {
  final CricketMatchesModel data;
  final String teamId;
  const ContestTab({super.key, required this.data, required this.teamId});

  @override
  State<ContestTab> createState() => _ContestTabState();
}

class _ContestTabState extends State<ContestTab> {
  @override
  Widget build(BuildContext context) {
    final userData = Provider.of<ProfileViewProvider>(context).userData;
    final heights = MediaQuery.of(context).size.height;
    final widths = MediaQuery.of(context).size.width;
    return Scaffold(
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: Container(
        width: widths / 1.3,
        height: heights / 18,
        decoration: BoxDecoration(
            color: Colors.red, borderRadius: BorderRadius.circular(20)),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            InkWell(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const CreateContestPage()));
              },
              child: SizedBox(
                height: heights / 28.5,
                width: widths / 3.2,
                child: const Row(
                  children: [
                    Icon(
                      Icons.emoji_events,
                      size: 25,
                      color: Colors.white,
                    ),
                    Text(
                      'Create Contest',
                      style: TextStyle(fontSize: 14, color: Colors.white),
                    ),
                  ],
                ),
              ),
            ),
            const VerticalDivider(
              thickness: 1,
              color: Colors.white,
              indent: 2,
              endIndent: 2,
            ),
            InkWell(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => CreateTeamTapBarPage(
                              match: widget.data,
                            )));
              },
              child: SizedBox(
                height: heights / 28.5,
                width: widths / 3.2,
                child: const Row(
                  children: [
                    Icon(
                      Icons.add,
                      size: 25,
                      color: Colors.white,
                    ),
                    Text(
                      'Create Team',
                      style: TextStyle(fontSize: 14, color: Colors.white),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
      body: FutureBuilder<List<ContestModel>>(
          future: que(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            } else if (snapshot.hasError) {
              return Center(
                child: Text('Error: ${snapshot.error}'),
              );
            } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
              return const Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "No Contest History",
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 25,
                          color: Colors.black),
                    ),
                  ],
                ),
              );
            } else {
              return ListView.builder(
                  itemCount: snapshot.data!.length,
                  scrollDirection: Axis.vertical,
                  itemBuilder: (BuildContext context, int index) {
                    return Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Card(
                        elevation: 5,
                        shape: BeveledRectangleBorder(
                            borderRadius: BorderRadius.circular(7.8)),
                        child: InkWell(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => CountryTabPage(
                                        match: widget.data,
                                        contest: snapshot.data![index],
                                        teamId: widget.teamId)));
                          },
                          child: Container(
                            height: heights / 5,
                            decoration: BoxDecoration(
                                border: Border.all(color: Colors.black26),
                                borderRadius: BorderRadius.circular(10)),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Padding(
                                  padding:
                                      const EdgeInsets.fromLTRB(15, 5, 15, 0),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            'Prize Pool',
                                            style: TextStyle(
                                                fontSize: heights / 55,
                                                color: Colors.grey),
                                          ),
                                          const SizedBox(
                                            height: 10,
                                          ),
                                          Text(
                                            '₹'
                                            '${snapshot.data![index].prizePool}',
                                            style: TextStyle(
                                                fontSize: heights / 40,
                                                fontWeight: FontWeight.bold),
                                          ),
                                        ],
                                      ),
                                      Column(
                                        children: [
                                          Text(
                                            'Winners',
                                            style: TextStyle(
                                                color: Colors.grey,
                                                fontSize: heights / 55),
                                          ),
                                          const SizedBox(
                                            height: 10,
                                          ),
                                          Text(
                                            '${snapshot.data![index].winners}',
                                            style: TextStyle(
                                                color: Colors.red,
                                                fontSize: heights / 50),
                                          ),
                                        ],
                                      ),
                                      Column(
                                        children: [
                                          Text(
                                            'Entry',
                                            style: TextStyle(
                                                color: Colors.grey,
                                                fontSize: heights / 55),
                                          ),
                                          const SizedBox(
                                            height: 10,
                                          ),
                                          InkWell(
                                            onTap: () {
                                              widget.teamId == ''
                                                  ? Navigator.push(
                                                      context,
                                                      MaterialPageRoute(
                                                          builder: (context) =>
                                                              CreateTeamTapBarPage(
                                                                  match: widget
                                                                      .data)))
                                                  : showDialog(
                                                      barrierColor:
                                                          Colors.transparent,
                                                      context: context,
                                                      builder:
                                                          (context) =>
                                                              AlertDialog(
                                                                shape: const RoundedRectangleBorder(
                                                                    borderRadius:
                                                                        BorderRadius.all(
                                                                            Radius.circular(20))),
                                                                backgroundColor:
                                                                    Colors
                                                                        .white,
                                                                content:
                                                                    Container(
                                                                  height:
                                                                      heights /
                                                                          3.5,
                                                                  width:
                                                                      widths /
                                                                          1.5,
                                                                  decoration: BoxDecoration(
                                                                      color: Colors
                                                                          .white,
                                                                      borderRadius:
                                                                          BorderRadius.circular(
                                                                              30)),
                                                                  child: Column(
                                                                    mainAxisAlignment:
                                                                        MainAxisAlignment
                                                                            .spaceEvenly,
                                                                    children: [
                                                                      Row(
                                                                        mainAxisAlignment:
                                                                            MainAxisAlignment.spaceBetween,
                                                                        children: [
                                                                          const Text(
                                                                            'Confirmation',
                                                                            style:
                                                                                TextStyle(fontWeight: FontWeight.bold, color: Colors.red),
                                                                          ),
                                                                          InkWell(
                                                                              onTap: () {
                                                                                Navigator.pop(context);
                                                                              },
                                                                              child: const Icon(Icons.close))
                                                                        ],
                                                                      ),
                                                                      Row(
                                                                        mainAxisAlignment:
                                                                            MainAxisAlignment.spaceBetween,
                                                                        children: [
                                                                          const Text(
                                                                            'Entry',
                                                                            style:
                                                                                TextStyle(fontWeight: FontWeight.bold),
                                                                          ),
                                                                          Text(
                                                                            '${snapshot.data![index].entry}',
                                                                            style:
                                                                                const TextStyle(color: Colors.red),
                                                                          ),
                                                                        ],
                                                                      ),
                                                                      const Row(
                                                                        mainAxisAlignment:
                                                                            MainAxisAlignment.spaceBetween,
                                                                        children: [
                                                                          Text(
                                                                              'Cash Bonus',
                                                                              style: TextStyle(fontWeight: FontWeight.bold)),
                                                                          Text(
                                                                            '-Rs.0',
                                                                            style:
                                                                                TextStyle(color: Colors.red),
                                                                          ),
                                                                        ],
                                                                      ),
                                                                      Divider(
                                                                        indent:
                                                                            heights /
                                                                                30,
                                                                        endIndent:
                                                                            heights /
                                                                                30,
                                                                        color: Colors
                                                                            .black26,
                                                                      ),
                                                                      Row(
                                                                        mainAxisAlignment:
                                                                            MainAxisAlignment.spaceBetween,
                                                                        children: [
                                                                          const Text(
                                                                              'To Pay',
                                                                              style: TextStyle(fontWeight: FontWeight.bold)),
                                                                          Text(
                                                                            '${snapshot.data![index].entry}',
                                                                            style:
                                                                                const TextStyle(color: Colors.red),
                                                                          ),
                                                                        ],
                                                                      ),
                                                                      InkWell(
                                                                        onTap:
                                                                            () {
                                                                          if (int.parse(total_amount.toString()) >=
                                                                              int.parse(snapshot.data![index].entry.toString())) {
                                                                            ApiController.joinContest(
                                                                                context,
                                                                                snapshot.data![index],
                                                                                widget.data,
                                                                                widget.teamId,
                                                                                userData!.referralCode.toString(),
                                                                                userData.image.toString(),
                                                                            );
                                                                          } else {
                                                                            Navigator.push(context,
                                                                                MaterialPageRoute(builder: (context) => const AddCash()));
                                                                          }
                                                                        },
                                                                        child:
                                                                            Container(
                                                                          height:
                                                                              heights / 20,
                                                                          width:
                                                                              widths / 2,
                                                                          decoration: BoxDecoration(
                                                                              color: Colors.red,
                                                                              borderRadius: BorderRadius.circular(10)),
                                                                          child:
                                                                              const Center(
                                                                            child:
                                                                                Text(
                                                                              'Join Contest',
                                                                              style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white),
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
                                              height: heights / 30,
                                              width: widths / 5.2,
                                              decoration: BoxDecoration(
                                                  color: Colors.red,
                                                  borderRadius:
                                                      BorderRadius.circular(5)),
                                              child: Center(
                                                  child: Text(
                                                snapshot.data![index].entry ==
                                                        '0'
                                                    ? 'Join'
                                                    : '₹ ${snapshot.data![index].entry}',
                                                style: const TextStyle(
                                                    color: Colors.white,
                                                    fontWeight:
                                                        FontWeight.bold),
                                              )),
                                            ),
                                          )
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                                Padding(
                                  padding:
                                      const EdgeInsets.fromLTRB(15, 5, 15, 0),
                                  child: StepProgressIndicator(
                                    totalSteps: int.parse(snapshot
                                        .data![index].totalTeam
                                        .toString()),
                                    currentStep: int.parse(snapshot
                                        .data![index].joinTeam
                                        .toString()),
                                    size: 5,
                                    padding: 0,
                                    selectedColor: Colors.grey,
                                    unselectedColor: Colors.grey,
                                    roundedEdges: const Radius.circular(10),
                                    selectedGradientColor: const LinearGradient(
                                      begin: Alignment.topLeft,
                                      end: Alignment.bottomRight,
                                      colors: [Colors.red, Colors.red],
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding:
                                      const EdgeInsets.fromLTRB(15, 5, 15, 0),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        '${snapshot.data![index].remainingTeam} Spots left',
                                        style: TextStyle(
                                            fontSize: heights / 60,
                                            color: Colors.red),
                                      ),
                                      Text(
                                        '${snapshot.data![index].totalTeam} Spots',
                                        style: TextStyle(
                                            fontSize: heights / 60,
                                            color: Colors.grey[600]),
                                      ),
                                    ],
                                  ),
                                ),
                                Container(
                                  height: heights / 19,
                                  width: widths / 1,
                                  decoration: const BoxDecoration(
                                      color: Colors.black12,
                                      borderRadius: BorderRadius.only(
                                          bottomRight: Radius.circular(5),
                                          bottomLeft: Radius.circular(5))),
                                  child: Padding(
                                    padding: EdgeInsets.only(
                                        right: heights / 45,
                                        left: heights / 45),
                                    child: const Row(
                                      children: [
                                        //  Icon(
                                        //   Icons.trophy,
                                        //   color: Colors.red,
                                        //   size: 20,
                                        // ),
                                        //  Text(
                                        //       '${snapshot.data![index].contestNote1}',
                                        //       style: TextStyle(
                                        //           color: Colors.red,
                                        //           fontSize: heights / 70)),

                                        Spacer(),
                                        // const Icon(
                                        //   Icons.rup,
                                        //   color: Colors.red,
                                        //   size: 20,
                                        // ),
                                        // Text(
                                        //     '${snapshot.data![index].contestNote2}',
                                        //     style: TextStyle(
                                        //         color: Colors.red,
                                        //         fontSize: heights / 70)),
                                      ],
                                    ),
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
                      ),
                    );
                  });
            }
          }),
    );
  }

  Future<List<ContestModel>> que() async {
    final response = await http.post(Uri.parse(ApiUrl.contestList),
        headers: <String, String>{
          'content-Type': 'application/json; charset=UTF-8',
        },
        body: jsonEncode(<String, String>{
          "type": '${widget.data.type}',
          "match_id": '${widget.data.matchId}',
        }));
    if (response.statusCode == 200) {
      final jsonData = json.decode(response.body)['data'] as List<dynamic>;
      return jsonData.map((item) => ContestModel.fromJson(item)).toList();
    } else {
      throw Exception('Failed to load data');
    }
  }
}
