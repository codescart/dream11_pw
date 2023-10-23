// ignore_for_file: library_private_types_in_public_api

import 'package:flutter/material.dart';
import '../../Model/my_match_model.dart';
import 'MyLiveWidget/my_live_tabs.dart';

class LiveScreen extends StatefulWidget {
  final List<MyMatchModel> liveMatches;
  const LiveScreen(this.liveMatches, {super.key});
  @override
  _LiveScreenState createState() => _LiveScreenState();
}

class _LiveScreenState extends State<LiveScreen> {
  @override
  Widget build(BuildContext context) {
    final heights = MediaQuery.of(context).size.height;
    final widths = MediaQuery.of(context).size.width;
    final data = widget.liveMatches;
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
                    itemBuilder: (BuildContext context, int index) {
                      return Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: InkWell(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => MyLiveTabs(
                                        liveMatches: widget.liveMatches[index])));
                          },
                          child: Card(
                            elevation: 5,
                            shape: BeveledRectangleBorder(
                                borderRadius: BorderRadius.circular(7.9)),
                            child: Container(
                              height: heights / 5,
                              decoration: BoxDecoration(
                                  border: Border.all(color: Colors.black26),
                                  borderRadius: BorderRadius.circular(10)),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Padding(
                                    padding:
                                        const EdgeInsets.fromLTRB(10, 5, 10, 5),
                                    child: Text(
                                      '${data[index].leagueName}',
                                      style: TextStyle(
                                          fontSize: 14,
                                          fontWeight: FontWeight.w400,
                                          color: Colors.grey[700]),
                                    ),
                                  ),
                                  const Divider(
                                    color: Colors.black26,
                                  ),
                                  Padding(
                                    padding:
                                        const EdgeInsets.fromLTRB(10, 5, 10, 5),
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
                                          size: 10,
                                          color: Colors.red,
                                        ),
                                        Text(
                                          'Live',
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
                                  Padding(
                                    padding:
                                        const EdgeInsets.fromLTRB(10, 0, 10, 0),
                                    child: Row(
                                      children: [
                                        Text(
                                          '${data[index].teamName1}',
                                          style: TextStyle(
                                              fontSize: 14,
                                              fontWeight: FontWeight.w600,
                                              color: Colors.grey[500]),
                                        ),
                                        const Spacer(
                                          flex: 1,
                                        ),
                                        Text(
                                          '${data[index].teamName2}',
                                          style: TextStyle(
                                              fontSize: 14,
                                              fontWeight: FontWeight.w600,
                                              color: Colors.grey[500]),
                                        ),
                                      ],
                                    ),
                                  ),
                                  const Divider(
                                    color: Colors.grey,
                                    thickness: 0.5,
                                  ),
                                  Padding(
                                    padding:
                                        const EdgeInsets.fromLTRB(10, 0, 0, 0),
                                    child: Text(
                                      '${data[index].teamCount} Team . ${data[index].contestCount} Contest',
                                      style: const TextStyle(
                                          fontSize: 12, color: Colors.grey),
                                    ),
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
