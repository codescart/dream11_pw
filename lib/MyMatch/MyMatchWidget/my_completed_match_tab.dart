// ignore_for_file: library_private_types_in_public_api

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../../Model/my_match_model.dart';
import 'MyCompletedWidget/my_completed_tabs.dart';

class CompletedScreen extends StatefulWidget {
  final List<MyMatchModel> completeMatches;
  const CompletedScreen(this.completeMatches, {super.key});
  @override
  _CompletedScreenState createState() => _CompletedScreenState();
}

class _CompletedScreenState extends State<CompletedScreen> {
  @override
  Widget build(BuildContext context) {
    final heights = MediaQuery.of(context).size.height;
    final widths = MediaQuery.of(context).size.width;
    final data = widget.completeMatches;
    return Scaffold(
      body: ListView(
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
                  child: Card(
                    elevation: 5,
                    shape: BeveledRectangleBorder(
                        borderRadius: BorderRadius.circular(7.9)),
                    child: InkWell(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => MyCompletedTabs(
                                    liveMatches:
                                        widget.completeMatches[index])));
                      },
                      child: Container(
                        height: heights / 5,
                        decoration: BoxDecoration(
                            border: Border.all(color: Colors.black26),
                            borderRadius: BorderRadius.circular(10)),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding: const EdgeInsets.fromLTRB(10, 5, 10, 5),
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
                              padding: const EdgeInsets.fromLTRB(10, 5, 10, 5),
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
                                    DateFormat("dd-MM-yyyy").format(
                                        DateTime.parse(data[index].modifiedDate
                                            as String)),
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
                              padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
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
                              padding: const EdgeInsets.fromLTRB(10, 0, 0, 0),
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
