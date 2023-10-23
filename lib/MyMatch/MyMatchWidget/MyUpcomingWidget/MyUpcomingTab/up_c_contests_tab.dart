// ignore_for_file: depend_on_referenced_packages

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:step_progress_indicator/step_progress_indicator.dart';
import 'package:dream11_pw/Constant/api_url.dart';
import 'package:dream11_pw/HomePage/PaytmTrophy/ActionButton/createContestPage.dart';
import 'package:http/http.dart' as http;
import '../../../../Model/contest_model.dart';
import '../../../../Model/my_match_model.dart';
import '../UpCoCreateTeamTab/up_c_create_team_tab_bar.dart';
import 'MyUpcomingJoin/container_join.dart';

class UpCoContestsTab extends StatefulWidget {
  final MyMatchModel data;
  final String teamId;
  const UpCoContestsTab({super.key, required this.data, required this.teamId});

  @override
  State<UpCoContestsTab> createState() => _UpCoContestsTabState();
}

class _UpCoContestsTabState extends State<UpCoContestsTab> {
  @override
  Widget build(BuildContext context) {
    final heights = MediaQuery.of(context).size.height;
    final widths = MediaQuery.of(context).size.width;
    return Scaffold(
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
                child: Row(
                  children: [
                    Icon(
                      Icons.emoji_events,
                      size: heights / 35,
                      color: Colors.white,
                    ),
                    Text(
                      'Create Contest',
                      style: TextStyle(
                          fontSize: heights / 60, color: Colors.white),
                    ),
                  ],
                ),
              ),
            ),
            const VerticalDivider(
              // width: 10,
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
                        builder: (context) => UpCoCreateTeamTapBarPage(myMatchModel: widget.data),
                    ));
              },
              child: SizedBox(
                height: heights / 28.5,
                width: widths / 3.2,
                // color: Colors.blue,
                child: Row(
                  children: [
                    Icon(
                      Icons.add,
                      size: heights / 35,
                      color: Colors.white,
                    ),
                    Text(
                      'Create Team',
                      style: TextStyle(
                          fontSize: heights / 60, color: Colors.white),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      body: FutureBuilder<List<ContestModel>>(
          future: que(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(
                child: CircularProgressIndicator(color: Colors.grey,),
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
                                    builder: (context) => ContainerJoin(
                                        myMatchModel: widget.data,
                                        contestModel: snapshot.data![index],
                                        teamId:widget.teamId
                                    )));
                          },
                          child: Container(
                            height: heights / 5.5,
                            decoration: BoxDecoration(
                                border: Border.all(color: Colors.black26),
                                borderRadius: BorderRadius.circular(10)),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Padding(
                                  padding:
                                      const EdgeInsets.fromLTRB(15, 5, 15, 5),
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
                                            height: 5,
                                          ),
                                          Text(
                                            '₹${snapshot.data![index].prizePool}',
                                            style: const TextStyle(
                                                fontSize: 16,
                                                fontWeight: FontWeight.bold),
                                          ),
                                        ],
                                      ),
                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        children: [
                                          Text(
                                            'Winners',
                                            style: TextStyle(
                                                color: Colors.grey,
                                                fontSize: heights / 55),
                                          ),
                                          const SizedBox(
                                            height: 5,
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
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        children: [
                                          Text(
                                            'Entry',
                                            style: TextStyle(
                                                color: Colors.grey,
                                                fontSize: heights / 55),
                                          ),
                                          const SizedBox(
                                            height: 5,
                                          ),
                                          InkWell(
                                            onTap: () {
                                              showDialog(
                                                  barrierColor:
                                                      Colors.transparent,
                                                  context: context,
                                                  builder:
                                                      (context) => AlertDialog(
                                                            shape: const RoundedRectangleBorder(
                                                                borderRadius: BorderRadius
                                                                    .all(Radius
                                                                        .circular(
                                                                            20))),
                                                            backgroundColor:
                                                                Colors.white,
                                                            content: Container(
                                                              height:
                                                                  heights / 3.5,
                                                              width:
                                                                  widths / 1.5,
                                                              decoration: BoxDecoration(
                                                                  color: Colors
                                                                      .white,
                                                                  borderRadius:
                                                                      BorderRadius
                                                                          .circular(
                                                                              30)),
                                                              child: Column(
                                                                mainAxisAlignment:
                                                                    MainAxisAlignment
                                                                        .spaceEvenly,
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
                                                                          onTap:
                                                                              () {
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
                                                                      Text(
                                                                        '${snapshot.data![index].entry}',
                                                                        style: const TextStyle(
                                                                            color:
                                                                                Colors.red),
                                                                      ),
                                                                    ],
                                                                  ),
                                                                  const Row(
                                                                    mainAxisAlignment:
                                                                        MainAxisAlignment
                                                                            .spaceBetween,
                                                                    children: [
                                                                      Text(
                                                                          'Cash Bonus',
                                                                          style:
                                                                              TextStyle(fontWeight: FontWeight.bold)),
                                                                      Text(
                                                                        '-Rs.0',
                                                                        style: TextStyle(
                                                                            color:
                                                                                Colors.red),
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
                                                                  const Row(
                                                                    mainAxisAlignment:
                                                                        MainAxisAlignment
                                                                            .spaceBetween,
                                                                    children: [
                                                                      Text(
                                                                          'To Pay',
                                                                          style:
                                                                              TextStyle(fontWeight: FontWeight.bold)),
                                                                      Text(
                                                                        'Rs.15',
                                                                        style: TextStyle(
                                                                            color:
                                                                                Colors.red),
                                                                      ),
                                                                    ],
                                                                  ),
                                                                  InkWell(
                                                                    onTap: () {
                                                                      // Navigator.push(
                                                                      //     context,
                                                                      //     MaterialPageRoute(
                                                                      //         builder: (context) => CountryTabPage(match: widget.data, contest: snapshot.data![index], teamId: '',)));
                                                                    },
                                                                    child:
                                                                        Container(
                                                                      height:
                                                                          heights /
                                                                              20,
                                                                      width:
                                                                          widths /
                                                                              2,
                                                                      decoration: BoxDecoration(
                                                                          color: Colors
                                                                              .red,
                                                                          borderRadius:
                                                                              BorderRadius.circular(10)),
                                                                      child:
                                                                          const Center(
                                                                        child:
                                                                            Text(
                                                                          'Join Contest',
                                                                          style: TextStyle(
                                                                              fontWeight: FontWeight.bold,
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
                                const SizedBox(
                                  height: 5,
                                ),
                                Padding(
                                  padding:
                                      const EdgeInsets.fromLTRB(15, 0, 15, 0),
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
                                const SizedBox(
                                  height: 2,
                                ),
                                Padding(
                                  padding:
                                      const EdgeInsets.fromLTRB(15, 0, 15, 0),
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
                                const SizedBox(
                                  height: 10,
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
