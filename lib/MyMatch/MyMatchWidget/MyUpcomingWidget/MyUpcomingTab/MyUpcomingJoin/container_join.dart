// ignore_for_file: depend_on_referenced_packages, use_build_context_synchronously

import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:step_progress_indicator/step_progress_indicator.dart';
import 'package:dream11_pw/Constant/api_url.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import 'package:dream11_pw/Model/contest_model.dart';
import 'package:dream11_pw/Model/my_match_model.dart';
import 'package:dream11_pw/MyMatch/MyMatchWidget/MyUpcomingWidget/up_c_select_team_and_join.dart';
import 'package:dream11_pw/Utils/utils.dart';
import '../../../../../Provider/view_profile_provider.dart';
import '../../up_c_tab_bar.dart';
import 'up_c_leader_bord_tab.dart';
import 'up_c_winning_tab.dart';

class ContainerJoin extends StatefulWidget {
  final MyMatchModel myMatchModel;
  final ContestModel contestModel;
  final String? teamId;
  const ContainerJoin(
      {super.key,
      required this.myMatchModel,
      this.teamId,
      required this.contestModel});

  @override
  State<ContainerJoin> createState() => _ContainerJoinState();
}

class _ContainerJoinState extends State<ContainerJoin>
    with TickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    final userData = Provider.of<ProfileViewProvider>(context).userData;
    TabController tabController = TabController(length: 2, vsync: this);
    final heights = MediaQuery.of(context).size.height;
    final widths = MediaQuery.of(context).size.width;
    return Scaffold(
        appBar: PreferredSize(
            preferredSize:  Size.fromHeight(heights/3.5),
            child: Container(
              color: Colors.grey[400],
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  AppBar(
                    leading: InkWell(
                        onTap: () {
                          Navigator.pop(context);
                        },
                        child: const Icon(Icons.arrow_back)),
                    title: Text(
                        '${widget.myMatchModel.teamShortName1} vs ${widget.myMatchModel.teamShortName2}'),
                    backgroundColor: Colors.black,
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(15,5,15,5),
                    child: Text(
                      'Prize Pool',
                      style:
                          TextStyle(color: Colors.grey[700], fontSize: 16,fontWeight: FontWeight.w600),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(15,0,15,5),
                    child: Text(
                      'Rs.${widget.contestModel.prizePool}',
                      style: TextStyle(
                          fontWeight: FontWeight.bold, fontSize: heights / 45),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(15,0,15,5),
                    child: StepProgressIndicator(
                      totalSteps: int.parse(widget.contestModel.totalTeam.toString()),
                      currentStep: int.parse(widget.contestModel.joinTeam.toString()),
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
                    padding: const EdgeInsets.fromLTRB(15,0,15,5),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          '${widget.contestModel.remainingTeam} spot left',
                          style: const TextStyle(color: Colors.red),
                        ),
                        Text(
                          '${widget.contestModel.totalTeam} spot',
                          style: const TextStyle(color: Colors.red),
                        )
                      ],
                    ),
                  ),
                  Center(
                    child: InkWell(
                      onTap: () {
                        widget.teamId == ''
                            ? Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>UpSelectTeamAndJoin(data: widget.myMatchModel,)))
                                        // UpCoCreateTeamTapBarPage(
                                        //   myMatchModel: widget.myMatchModel,
                                        // )))
                            : showDialog(
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
                                                Text(
                                                  'Rs.${widget.contestModel.entry}',
                                                  style: const TextStyle(
                                                      color: Colors.red),
                                                ),
                                              ],
                                            ),
                                            const Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                Text('Cash Bonus',
                                                    style: TextStyle(
                                                        fontWeight:
                                                            FontWeight.bold)),
                                                Text(
                                                  '-Rs.0',
                                                  style: TextStyle(
                                                      color: Colors.red),
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
                                                Text(
                                                  'Rs.${widget.contestModel.entry}',
                                                  style: const TextStyle(
                                                      color: Colors.red),
                                                ),
                                              ],
                                            ),
                                            InkWell(
                                              onTap: () {
                                                joinContest(userData!.referralCode.toString(),userData.image.toString());
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
                        height: heights / 22,
                        width: widths / 1.1,
                        decoration: BoxDecoration(
                            color: Colors.red,
                            borderRadius: BorderRadius.circular(10)),
                        child: Center(
                            child: Text(
                          widget.contestModel.entry == '0'
                              ? 'Join'
                              : 'Join ₹ ${widget.contestModel.entry}',
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: heights / 40),
                        )),
                      ),
                    ),
                  ),
                  TabBar(
                    controller: tabController,
                    labelColor: Colors.red,
                    unselectedLabelColor: Colors.black,
                    indicatorColor: Colors.red,
                    indicatorWeight: 5,
                    indicatorPadding: const EdgeInsets.fromLTRB(15, 0, 15, 0),
                    labelStyle: const TextStyle(fontWeight: FontWeight.w600,fontSize: 16),
                    tabs: const [
                      Tab(text: "Winnings"),
                      Tab(text: "Leaderboard"),
                    ],
                  ),
                ],
              ),
            )),
        body: TabBarView(controller: tabController, children: [
          UpCoWinningTab(
            myMatchModel: widget.myMatchModel,
            contestModel: widget.contestModel,
          ),
          UpCoLeaderBordTab(
            myMatchModel: widget.myMatchModel,
            contestModel: widget.contestModel,
          ),
        ]));
  }

  joinContest(String referralCode ,String image, ) async {
    final prefs = await SharedPreferences.getInstance();
    final userid = prefs.getString("userid");
    final res = await http.post(Uri.parse(ApiUrl.joinContest),
        headers: <String, String>{
          'content-Type': 'application/json; charset=UTF-8',
        },
        body: jsonEncode(<String, String>{
          "user_id": userid.toString(),
          "my_team_id": widget.teamId.toString(),
          "name": widget.contestModel.contestName.toString(),
          "contest_amount": widget.contestModel.entry.toString(),
          "match_id": widget.contestModel.matchId.toString(),
          "TeamName": referralCode,
          "image": image,
          "contest_id": widget.contestModel.contestId.toString()
        }));
    final response = jsonDecode(res.body);
    if (res.statusCode == 200) {
      if (response['status'] == 'success') {
        Navigator.pushReplacement(
            context,
            MaterialPageRoute(
                builder: (context) =>
                    UpCoTabBar(data: widget.myMatchModel, tabIndex: 1)));
        return Utils.showToast(response['message'].toString());
      } else {
        return Utils.showToast(response['message'].toString());
      }
    } else {
      throw Exception('Server error');
    }
  }
}
