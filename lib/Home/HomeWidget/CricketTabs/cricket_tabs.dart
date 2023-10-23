import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:dream11_pw/Model/cricket_matches_model.dart';
import 'TabsWidget/contest_tab.dart';
import 'TabsWidget/my_contest_tab.dart';
import 'TabsWidget/my_save_team_tab.dart';

class CricketTabs extends StatefulWidget {
  final CricketMatchesModel data;
  final String? teamId;
  final int? tabIndex;
  const CricketTabs({
    super.key,
    required this.data,
    this.teamId,
    this.tabIndex,
  });

  @override
  State<CricketTabs> createState() => _CricketTabsState();
}

class _CricketTabsState extends State<CricketTabs>
    with TickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    TabController tabController = TabController(
        length: 3, vsync: this, initialIndex: widget.tabIndex ?? 0);
    final heights = MediaQuery.of(context).size.height;
    final widths = MediaQuery.of(context).size.width;
    return Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          leading: InkWell(
              onTap: () {
                Navigator.pop(context);
              },
              child: const Icon(Icons.arrow_back)),
          title: Text('${widget.data.type}'),
          backgroundColor: Colors.red,
        ),
        body: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
          SizedBox(
            height: heights / 35,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Image(
                  image: NetworkImage('${widget.data.teamImage1}'),
                ),
                Text(
                  '${widget.data.teamShortName1}',
                  style: TextStyle(fontSize: heights / 50, color: Colors.black),
                ),
                Text(
                  'vs',
                  style: TextStyle(fontSize: heights / 50, color: Colors.black),
                ),
                Text(
                  '${widget.data.teamShortName2}',
                  style: TextStyle(fontSize: heights / 50, color: Colors.black),
                ),
                Image(
                  image: NetworkImage('${widget.data.teamImage2}'),
                ),
                SizedBox(
                  width: widths / 15,
                ),
                Text(
                  DateFormat("dd-MM-yyyy hh:mm a").format(widget.data.matchDateTime!),
                  style: TextStyle(fontSize: heights / 60, color: Colors.black),
                ),
              ],
            ),
          ),
          TabBar(
            controller: tabController,
            labelColor: Colors.red,
            unselectedLabelColor: Colors.black,
            indicatorPadding: const EdgeInsets.fromLTRB(15, 0, 15, 0),
            indicatorColor: Colors.red,
            indicatorWeight: 5,
            labelStyle:
                const TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
            tabs: const [
              Tab(text: "Contest"),
              Tab(text: "My Contest"),
              Tab(text: "My Team"),
            ],
          ),
          SizedBox(
            height: heights / 1.3,
            width: widths,
            child: TabBarView(controller: tabController, children: [
              ContestTab(data: widget.data, teamId: widget.teamId.toString()),
              MyContestTab(data: widget.data),
              MySaveTeamTab(data: widget.data),
            ]),
          ),
        ]));
  }
}
