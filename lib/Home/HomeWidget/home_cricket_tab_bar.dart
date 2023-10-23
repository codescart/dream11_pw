// ignore_for_file: depend_on_referenced_packages

import 'dart:async';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../../Api/cricket_matches_controller.dart';
import '../../Constant/api_url.dart';
import '../../Model/cricket_matches_model.dart';
import 'CricketTabs/cricket_tabs.dart';

class HomeCricketTabBar extends StatefulWidget {
  const HomeCricketTabBar({super.key});

  @override
  State<HomeCricketTabBar> createState() => _HomeCricketTabBarState();
}

class _HomeCricketTabBarState extends State<HomeCricketTabBar> {
  @override
  Widget build(BuildContext context) {
    final heights = MediaQuery.of(context).size.height;
    final widths = MediaQuery.of(context).size.width;
    if (isLoading == true) {
      return const Center(
          child: CircularProgressIndicator(
        color: Colors.deepOrange,
      ));
    } else if (upcomingMatches.isEmpty) {
      return const Center(child: Text('No upcoming matches available.'));
    } else {
      return ListView.builder(
          itemCount: upcomingMatches.length,
          scrollDirection: Axis.vertical,
          shrinkWrap: true,
          itemBuilder: (BuildContext context, int index) {
            final matchDate = '${upcomingMatches[index].matchDateTime}'
                .toString()
                .split('.')
                .first
                .split(' ')
                .first
                .split('-');
            final matchTime = '${upcomingMatches[index].matchDateTime}'
                .split('.')
                .first
                .split(' ')
                .last
                .split(':');
            DateTime currentTime = DateTime.now();
            DateTime specificTime = DateTime(
                int.parse(matchDate[0].toString()),
                int.parse(matchDate[1].toString()),
                int.parse(matchDate[2].toString()),
                int.parse(matchTime[0].toString()),
                int.parse(matchTime[1].toString()),
                int.parse(matchTime[2].toString()));

            Duration difference = specificTime.difference(currentTime);
            int differenceInMinutes = difference.inSeconds;
            return Padding(
              padding: const EdgeInsets.all(8.0),
              child: Card(
                elevation: 5,
                shape: BeveledRectangleBorder(
                    borderRadius: BorderRadius.circular(7.9)),
                child: InkWell(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => CricketTabs(
                                  data: upcomingMatches[index],
                                  teamId: '',
                                )));
                  },
                  child: Container(
                    height: heights / 4.5,
                    decoration: BoxDecoration(
                        border: Border.all(color: Colors.black26),
                        borderRadius: BorderRadius.circular(10)),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        SizedBox(
                          height: heights / 55,
                          child: Padding(
                            padding: EdgeInsets.only(
                                left: heights / 40, right: heights / 40),
                            child: Row(
                              children: [
                                Text(
                                  '${upcomingMatches[index].leagueName}',
                                  style: TextStyle(fontSize: heights / 60),
                                ),
                                const Spacer(
                                  flex: 1,
                                ),
                                upcomingMatches[index].elevenOut == '0'
                                    ? Text(
                                        '👕',
                                        style: TextStyle(
                                            color: Colors.grey,
                                            fontSize: heights / 60),
                                      )
                                    : const Row(
                                        children: [
                                          Icon(
                                            Icons.groups,
                                            color: Colors.deepOrange,
                                          ),
                                          Text(
                                            'Lineup out',
                                            style: TextStyle(
                                                color: Colors.deepOrange),
                                          ),
                                        ],
                                      ),
                              ],
                            ),
                          ),
                        ),
                        Divider(
                          indent: heights / 40,
                          endIndent: heights / 40,
                          color: Colors.black26,
                        ),
                        Column(
                          children: [
                            Padding(
                              padding: EdgeInsets.only(
                                  left: heights / 40, right: heights / 40),
                              child: Row(
                                children: [
                                  Text(
                                    '${upcomingMatches[index].teamName1}',
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: heights / 65),
                                  ),
                                  const Spacer(
                                    flex: 1,
                                  ),
                                  Text(
                                    '${upcomingMatches[index].teamName2}',
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: heights / 65),
                                  ),
                                ],
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.all(heights / 65),
                              child: Row(
                                children: [
                                  Container(
                                    height: heights / 18,
                                    width: widths / 08,
                                    decoration: BoxDecoration(
                                        image: DecorationImage(
                                      fit: BoxFit.fill,
                                      image: NetworkImage(
                                          '${upcomingMatches[index].teamImage1}'),
                                    )),
                                  ),
                                  const Spacer(flex: 1),
                                  Icon(
                                    Icons.fiber_manual_record_rounded,
                                    color: Colors.red,
                                    size: heights / 50,
                                  ),
                                  Column(
                                    children: [
                                      buildTime1(differenceInMinutes - secondsRemaining),
                                      Text(
                                        DateFormat("dd-MM-yyyy hh:mm a").format(upcomingMatches[index].matchDateTime!),
                                        style: TextStyle(
                                            fontSize: heights / 60,
                                            color: Colors.red),
                                      ),
                                    ],
                                  ),
                                  const Spacer(flex: 1),
                                  Container(
                                    height: heights / 18,
                                    width: widths / 08,
                                    decoration: BoxDecoration(
                                        image: DecorationImage(
                                      fit: BoxFit.fill,
                                      image: NetworkImage(
                                          '${upcomingMatches[index].teamImage2}'),
                                    )),
                                  )
                                ],
                              ),
                            ),
                            const Divider(
                              thickness: 0.5,
                            ),
                            Padding(
                              padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  const Text(
                                    'Mega ₹ 31 L',
                                    style: TextStyle(
                                        fontSize: 12, color: Colors.grey),
                                  ),
                                  Container(
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(20),
                                        border: Border.all(
                                            color: Colors.grey, width: 0.5)),
                                    child: const Padding(
                                      padding:
                                          EdgeInsets.fromLTRB(10, 5, 10, 5),
                                      child:
                                          Icon(Icons.notification_add_outlined),
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            );
          });
    }
  }

  List<CricketMatchesModel> upcomingMatches = [];

  @override
  void initState() {
    super.initState();
    fetchData();
    startTimer();
  }

  Future<void> fetchData() async {
    try {
      setState(() {
        isLoading = true;
      });
      List<CricketMatchesModel> matches =
          await CricketMatchesController.fetchMatches(
              "Fixture", ApiUrl.upComingMatch);
      setState(() {
        upcomingMatches = matches;
      });
    } catch (e) {
      setState(() {
        isLoading = false;
      });
      if (kDebugMode) {
        print('Error fetching upcoming matches: $e');
      }
    } finally {
      setState(() {
        isLoading = false;
      });
    }
  }

  Widget buildTime1(int sec) {
    int totalSeconds = sec; // Replace this with your desired number of seconds

    int days = totalSeconds ~/ (24 * 3600);
    int hours = (totalSeconds % (24 * 3600)) ~/ 3600;
    int minutes = (totalSeconds % 3600) ~/ 60;
    int seconds = totalSeconds % 60;
    String timeInMinutes = "$days d $hours h $minutes m $seconds s";
    return Row(mainAxisAlignment: MainAxisAlignment.center, children: [
      buildTimeCard(
        time: timeInMinutes,
      ),
    ]);
  }

  Widget buildTimeCard({required String time}) => Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            padding: const EdgeInsets.all(8),
            decoration: BoxDecoration(
                color: Colors.transparent,
                borderRadius: BorderRadius.circular(10)),
            child: Text(
              time,
              style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                  fontSize: 15),
            ),
          ),
        ],
      );

  Timer? timer;
  int secondsRemaining = 0;
  bool isLoading = false;
  void startTimer() {
    timer = Timer.periodic(const Duration(seconds: 1), (timer) async {
      setState(() {
        secondsRemaining = secondsRemaining + 1;
      });
    });
  }

  @override
  void dispose() {
    super.dispose();
    timer!.cancel(); // Cancel timers when the screen is disposed
  }
}
