// ignore_for_file: depend_on_referenced_packages

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:dream11_pw/Constant/Button/rectangleButton.dart';
import 'package:dream11_pw/BottomNavBar/bottom_nav_bar.dart';
import 'package:dream11_pw/Model/cricket_matches_model.dart';
import '../../../../Api/api_controller.dart';
import '../../../../Constant/images.dart';
import '../../../../Model/join_contest_model.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:step_progress_indicator/step_progress_indicator.dart';

import '../../../../MyMatch/MyMatchWidget/MyUpcomingWidget/MyUpcomingTab/up_c_contests_view.dart';

class MyContestTab extends StatefulWidget {
  final CricketMatchesModel data;
  const MyContestTab({super.key, required this.data});

  @override
  State<MyContestTab> createState() => _MyContestTabState();
}

class _MyContestTabState extends State<MyContestTab> {
  @override
  Widget build(BuildContext context) {
    final heights = MediaQuery.of(context).size.height;
    final widths = MediaQuery.of(context).size.width;
    return isLoading
        ? const Center(
            child: CircularProgressIndicator(
            color: Colors.deepOrange,
          ))
        : joinContestList.isEmpty
            ? SizedBox(
                height: heights / 1.9,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    const Text(
                      'You have not joined contest yet',
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
                    CustomButton(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const BottomNavBar()));
                        },
                        text: 'Join Contest')
                  ],
                ),
              )
            : ListView.builder(
        itemCount: joinContestList.length,
        scrollDirection: Axis.vertical,
        itemBuilder: (BuildContext context, int index) {
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: Card(
              elevation: 5,
              child: Column(
                children: [
                  Container(
                    height: heights / 7.5,
                    decoration: const BoxDecoration(
                        borderRadius: BorderRadius.only(
                            topRight: Radius.circular(5),
                            topLeft: Radius.circular(5),
                            bottomRight: Radius.zero,
                            bottomLeft: Radius.zero)),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding:
                          const EdgeInsets.fromLTRB(10, 5, 10, 5),
                          child: Text(
                            '${joinContestList[index].contestName}',
                            style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w600,
                                color: Colors.grey[800]),
                          ),
                        ),
                        Padding(
                          padding:
                          const EdgeInsets.fromLTRB(15, 5, 15, 5),
                          child: StepProgressIndicator(
                            totalSteps: int.parse(joinContestList[index]
                                .totalTeam
                                .toString()),
                            currentStep: int.parse(
                                joinContestList[index]
                                    .joinTeam
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
                          const EdgeInsets.fromLTRB(15, 0, 15, 0),
                          child: Row(
                            mainAxisAlignment:
                            MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                '${joinContestList[index].remainingTeam}' ==
                                    '0'
                                    ? 'Contest Full'
                                    : '${joinContestList[index].remainingTeam} Spots Left',
                                style: TextStyle(
                                    fontSize: heights / 60,
                                    color: Colors.red),
                              ),
                              Text(
                                '${joinContestList[index].totalTeam} spots',
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
                          color: Colors.grey[200],
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
                        ),
                      ],
                    ),
                  ),
                  ExpansionTile(
                    textColor: Colors.black,
                    iconColor: Colors.black,
                    title: Text(
                        'Join with ${joinContestList[index].teamCount} team'),
                    subtitle:
                    Text('${joinContestList[index].teamNumber}'),
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(15),
                        child: InkWell(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        UpCoContestView(
                                            joinContestList:
                                            joinContestList[index],
                                        )));
                          },
                          child: Container(
                            padding: const EdgeInsets.fromLTRB(
                                10, 10, 10, 10),
                            decoration: BoxDecoration(
                                color: Colors.orange.withOpacity(0.1),
                                border: Border.all(
                                    width: 0.5, color: Colors.grey),
                                borderRadius: const BorderRadius.all(
                                    Radius.circular(10))),
                            child: Column(
                              children: [
                                Row(
                                  mainAxisAlignment:
                                  MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      '${joinContestList[index].teamNumber}',
                                      style: TextStyle(
                                          fontSize: heights / 60,
                                          color: Colors.grey[600]),
                                    ),
                                    const Icon(Icons.edit),
                                  ],
                                ),
                                Row(
                                  children: [
                                    Column(
                                      crossAxisAlignment:
                                      CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          'Captain',
                                          style: TextStyle(
                                              fontSize: heights / 60,
                                              color: Colors.grey[600]),
                                        ),
                                        Text(
                                          '${joinContestList[index].captain}'
                                              .split(' ')
                                              .first,
                                          style: TextStyle(
                                              fontSize: heights / 60,
                                              color: Colors.grey[600]),
                                        ),
                                      ],
                                    ),
                                    const SizedBox(
                                      width: 15,
                                    ),
                                    Column(
                                      crossAxisAlignment:
                                      CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          'Vice Captain',
                                          style: TextStyle(
                                              fontSize: heights / 60,
                                              color: Colors.grey[600]),
                                        ),
                                        Text(
                                          '${joinContestList[index].viceCaptain}'
                                              .split(' ')
                                              .first,
                                          style: TextStyle(
                                              fontSize: heights / 60,
                                              color: Colors.grey[600]),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
          );
        });
  }

  @override
  void initState() {
    super.initState();
    fetchData();
  }

  List<JoinContestModel> joinContestList = [];
  bool isLoading = true;


  Future<void> fetchData() async {
    final prefs = await SharedPreferences.getInstance();
    final userid = prefs.getString("userid");
    try {
      List<JoinContestModel> matchContestList =
      await ApiController.fetchJoinContest(
          widget.data.matchId.toString(), userid.toString());
      setState(() {
        joinContestList = matchContestList;
      });
    } catch (e) {
      if (kDebugMode) {
        print('Error fetching upcoming matches: $e');
      }
    } finally {
      setState(() {
        isLoading = false;
      });
    }
  }
}
