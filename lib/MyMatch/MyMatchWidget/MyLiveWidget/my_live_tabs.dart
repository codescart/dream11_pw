import 'package:flutter/material.dart';
import 'package:dream11_pw/Model/my_match_model.dart';
import '../../../Constant/dotted_border.dart';
import 'my_join_contest_list_live.dart';
import 'my_join_live_teams.dart';


class MyLiveTabs extends StatefulWidget {
  final MyMatchModel liveMatches;

  const MyLiveTabs({super.key, required this.liveMatches});

  @override
  State<MyLiveTabs> createState() => _MyLiveTabsState();
}

class _MyLiveTabsState extends State<MyLiveTabs> {
  @override
  Widget build(BuildContext context) {
    final heights = MediaQuery.of(context).size.height;
    final widths = MediaQuery.of(context).size.width;
    return DefaultTabController(
      length: 3,
      initialIndex: 0,
      child: Scaffold(
        appBar: PreferredSize(
            preferredSize: Size.fromHeight(heights / 3.1),
            child: Container(
              color: Colors.black,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  AppBar(
                    leading: InkWell(
                        onTap: () {
                          Navigator.pop(context);
                        },
                        child: const Icon(Icons.arrow_back)),
                    title: Text(
                      '${widget.liveMatches.teamShortName1} vs ${widget.liveMatches.teamShortName2}',
                      style: const TextStyle(fontSize: 16),
                    ),
                    backgroundColor: Colors.black,
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(15, 0, 15, 0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              '${widget.liveMatches.teamName1}',
                              style: const TextStyle(
                                  color: Colors.white54,
                                  fontSize: 12,
                                  fontWeight: FontWeight.w600),
                            ),
                            const SizedBox(
                              height: 8,
                            ),
                            SizedBox(
                              child: Row(
                                children: [
                                  CircleAvatar(
                                      backgroundImage: NetworkImage(
                                          '${widget.liveMatches.teamImage1}'),
                                      radius: 16),
                                  const SizedBox(
                                    width: 10,
                                  ),
                                  const Text(
                                    'Yet to Bat',
                                    style: TextStyle(
                                        color: Colors.white54,
                                        fontSize: 12,
                                        fontWeight: FontWeight.w600),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Text(
                              '${widget.liveMatches.teamName2}',
                              style: const TextStyle(
                                  color: Colors.white54,
                                  fontSize: 12,
                                  fontWeight: FontWeight.w600),
                            ),
                            const SizedBox(
                              height: 8,
                            ),
                            SizedBox(
                              child: Row(
                                children: [
                                  const Text(
                                    'Yet to Bat',
                                    style: TextStyle(
                                        color: Colors.white54,
                                        fontSize: 12,
                                        fontWeight: FontWeight.w600),
                                  ),
                                  const SizedBox(
                                    width: 10,
                                  ),
                                  CircleAvatar(
                                      backgroundImage: NetworkImage(
                                          '${widget.liveMatches.teamImage2}'),
                                      radius: 16),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  const Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          CircleAvatar(
                            radius: 5,
                            backgroundColor: Colors.red,
                          ),
                          SizedBox(
                            width: 5,
                          ),
                          Text(
                            'LIVE',
                            style: TextStyle(fontSize: 12, color: Colors.white),
                          ),
                        ],
                      ),
                      SizedBox(height: 10),
                      Text('Prjected score: 256 @ 5.1 RPO',
                          style: TextStyle(fontSize: 12, color: Colors.white))
                    ],
                  ),
                  const Divider(
                    color: Colors.white70,
                    thickness: 0.5,
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(15, 0, 15, 8),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        SizedBox(
                          width: widths / 2.5,
                          child: const Column(
                            children: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text('p1',
                                      style: TextStyle(
                                          fontSize: 12, color: Colors.white)),
                                  Text('sc',
                                      style: TextStyle(
                                          fontSize: 12, color: Colors.white)),
                                ],
                              ),
                              SizedBox(height: 8),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text('p2',
                                      style: TextStyle(
                                          fontSize: 12, color: Colors.white)),
                                  Text('sc',
                                      style: TextStyle(
                                          fontSize: 12, color: Colors.white)),
                                ],
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(
                          width: 30,
                        ),
                        SizedBox(
                          width: widths / 2.5,
                          child: Column(
                            children: [
                              const Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text('b name',
                                      style: TextStyle(
                                          fontSize: 12, color: Colors.white)),
                                  Text('w/r (o)',
                                      style: TextStyle(
                                          fontSize: 12, color: Colors.white)),
                                ],
                              ),
                              const SizedBox(
                                height: 8,
                              ),
                              Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: List.generate(
                                    6,
                                    (index) => const DottedCircleBorder(
                                        radius: 10.0,
                                        borderWidth: 1,
                                        child: Padding(
                                          padding:
                                              EdgeInsets.fromLTRB(5, 2, 0, 0),
                                          child: Text(
                                            '0',
                                            style: TextStyle(
                                                color: Colors.white70),
                                            textAlign: TextAlign.center,
                                          ),
                                        )),
                                  )),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    color: Colors.white,
                    child: const TabBar(
                      labelColor: Colors.red,
                      unselectedLabelColor: Colors.black,
                      indicatorColor: Colors.red,
                      indicatorWeight: 5,
                      indicatorPadding: EdgeInsets.fromLTRB(15, 0, 15, 0),
                      labelStyle:
                          TextStyle(fontWeight: FontWeight.w600, fontSize: 16),
                      tabs: [
                        Tab(text: "My Contests"),
                        Tab(text: "My Teams"),
                        Tab(text: "Scorecard"),
                      ],
                    ),
                  ),
                ],
              ),
            )),
        body: TabBarView(children: [
          MyJoinContestListLive(liveMatches:widget.liveMatches),
          const MyJoinLiveTeams(),
          Container(),
        ]),
      ),
    );
  }
}

