import 'dart:math';

import 'package:flutter/material.dart';
import 'package:dream11_pw/Model/my_match_model.dart';

import '../MyLiveWidget/my_join_contest_list_live.dart';


class MyCompletedTabs extends StatefulWidget {
  final MyMatchModel liveMatches;

  const MyCompletedTabs({super.key, required this.liveMatches});

  @override
  State<MyCompletedTabs> createState() => _MyCompletedTabsState();
}

class _MyCompletedTabsState extends State<MyCompletedTabs> {
  @override
  Widget build(BuildContext context) {
    final heights = MediaQuery.of(context).size.height;
    // final widths = MediaQuery.of(context).size.width;
    return DefaultTabController(
      length: 3,
      initialIndex: 0,
      child: Scaffold(
        appBar: PreferredSize(
            preferredSize: Size.fromHeight(heights/4),
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
                            backgroundColor: Colors.green,
                          ),
                          SizedBox(
                            width: 5,
                          ),
                          Text(
                            'COMPLETED',
                            style: TextStyle(fontSize: 12, color: Colors.white),
                          ),
                        ],
                      ),
                      SizedBox(height: 10),
                      Text('IND beat BAN by 7 wickets',
                          style: TextStyle(fontSize: 12, color: Colors.white))
                    ],
                  ),
                  Container(
                    color: Colors.white,
                    margin: const EdgeInsets.fromLTRB(0, 8, 0, 0),
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
          Container(),
          Container(),
        ]),
      ),
    );
  }
}

class DottedCircleBorder extends StatelessWidget {
  final double radius;
  final double borderWidth;
  final Widget? child;

  const DottedCircleBorder(
      {super.key, required this.radius, required this.borderWidth, this.child});

  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      size: Size(2 * (radius + borderWidth), 2 * (radius + borderWidth)),
      painter: DottedCirclePainter(radius, borderWidth),
      child: child,
    );
  }
}

class DottedCirclePainter extends CustomPainter {
  final double radius;
  final double borderWidth;

  DottedCirclePainter(this.radius, this.borderWidth);

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = Colors.white70 // Border color
      ..style = PaintingStyle.stroke
      ..strokeWidth = borderWidth
      ..strokeCap = StrokeCap.round;

    const double spacing = 5.0; // Adjust the spacing between dots

    // Calculate the number of dots needed
    final double circumference = 2 * radius * 3.14159265359;
    final int numberOfDots = (circumference / spacing).round();

    // Draw the dotted border
    for (int i = 0; i < numberOfDots; i++) {
      double radians = (i / numberOfDots) * 3.14159265359 * 2;
      double x = radius + radius * cos(radians);
      double y = radius + radius * sin(radians);

      canvas.drawCircle(Offset(x, y), borderWidth / 2, paint);
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}
