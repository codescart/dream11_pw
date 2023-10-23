// ignore_for_file: library_private_types_in_public_api

import 'package:flutter/material.dart';
import '../../Api/time_convert.dart';
import '../../Model/my_match_model.dart';
import 'MyUpcomingWidget/up_c_tab_bar.dart';

class UpComingScreen extends StatefulWidget {
  final List<MyMatchModel> upcomingMatches;
  const UpComingScreen(this.upcomingMatches, {super.key});
  @override
  _UpComingScreenState createState() => _UpComingScreenState();
}

class _UpComingScreenState extends State<UpComingScreen> {
  @override
  Widget build(BuildContext context) {
    final heights = MediaQuery.of(context).size.height;
    final widths = MediaQuery.of(context).size.width;
    final data = widget.upcomingMatches;
    return Scaffold(
      body: data.isEmpty
          ? const Center(child: Text('No Contest join'))
          : ListView(
              shrinkWrap: true,
              physics: const BouncingScrollPhysics(),
              children: [
                ListView.builder(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: data.length,
                    itemBuilder: (BuildContext ctx, int index) {
                      return Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Card(
                          elevation: 5,
                          shape: BeveledRectangleBorder(
                              borderRadius: BorderRadius.circular(7.9)),
                          child: InkWell(
                            onTap: () {
                              Navigator.push(context, MaterialPageRoute(builder: (context)=>UpCoTabBar(data: data[index], teamId: '',)));
                            },
                            child: Container(
                              height: heights / 3.86,
                              decoration: BoxDecoration(
                                  border: Border.all(color: Colors.black26),
                                  borderRadius: BorderRadius.circular(10)),
                              child: Column(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  SizedBox(
                                    height: heights / 55,
                                    child: Padding(
                                      padding: EdgeInsets.only(
                                          left: heights / 40,
                                          right: heights / 40),
                                      child: Row(
                                        children: [
                                          Text(
                                            '${data[index].leagueName}',
                                            style: TextStyle(
                                                fontSize: heights / 60),
                                          ),
                                          const Spacer(
                                            flex: 1,
                                          ),
                                          data[index].elevenOut == '0'
                                              ? Text(
                                                  '👕',
                                                  style: TextStyle(
                                                      color: Colors.grey,
                                                      fontSize: heights / 60),
                                                )
                                              : const Row(
                                                  children: [
                                                    Icon(
                                                      Icons.people_outline,
                                                      color: Colors.deepOrange,
                                                    ),
                                                    Text(
                                                      'Lineup out',
                                                      style: TextStyle(
                                                          color: Colors
                                                              .deepOrange),
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
                                            left: heights / 40,
                                            right: heights / 40),
                                        child: Row(
                                          children: [
                                            Text(
                                              '${data[index].teamName1}',
                                              style: TextStyle(
                                                  fontWeight: FontWeight.bold,
                                                  fontSize: heights / 65),
                                            ),
                                            const Spacer(
                                              flex: 1,
                                            ),
                                            Text(
                                              '${data[index].teamName2}',
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
                                                    '${data[index].teamImage1}'),
                                              )),
                                            ),
                                            const Spacer(flex: 1),
                                            const Icon(
                                              Icons.fiber_manual_record_rounded,
                                              color: Colors.red,
                                            ),
                                            Text(
                                              TimeConvert.timeLeft(
                                                  data[index].time!),
                                              style: TextStyle(
                                                  fontSize: heights / 60,
                                                  color: Colors.red),
                                            ),
                                            const Spacer(flex: 1),
                                            Container(
                                              height: heights / 18,
                                              width: widths / 08,
                                              decoration: BoxDecoration(
                                                  image: DecorationImage(
                                                fit: BoxFit.fill,
                                                image: NetworkImage(
                                                    '${data[index].teamImage2}'),
                                              )),
                                            )
                                          ],
                                        ),
                                      ),
                                      const Divider(
                                        thickness: 0.5,
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.fromLTRB(
                                            10, 0, 10, 0),
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Text(
                                              '${data[index].teamCount} Team . ${data[index].contestCount} Contest',
                                              style: const TextStyle(
                                                  fontSize: 12,
                                                  color: Colors.grey),
                                            ),
                                            Container(
                                              decoration: BoxDecoration(
                                                  borderRadius:
                                                      BorderRadius.circular(20),
                                                  border: Border.all(
                                                      color: Colors.grey,
                                                      width: 0.5)),
                                              child: const Padding(
                                                padding: EdgeInsets.fromLTRB(
                                                    10, 5, 10, 5),
                                                child: Icon(Icons
                                                    .notification_add_outlined),
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
                    }),
              ],
            ),
    );
  }
}
