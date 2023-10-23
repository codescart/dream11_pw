import 'package:flutter/material.dart';
import 'package:dream11_pw/Model/my_match_model.dart';
import '../../../Api/time_convert.dart';
import 'MyUpcomingTab/up_c_contests_tab.dart';
import 'MyUpcomingTab/up_c_my_contests_tab.dart';
import 'MyUpcomingTab/up_c_my_teams_tab.dart';

class UpCoTabBar extends StatefulWidget {
  final String? teamId;
  final int? tabIndex;
  final MyMatchModel data;
  const UpCoTabBar({super.key, this.teamId, this.tabIndex, required this.data});

  @override
  State<UpCoTabBar> createState() => _UpCoTabBarState();
}

class _UpCoTabBarState extends State<UpCoTabBar> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: 3,
        initialIndex: widget.tabIndex??0,
        child: Scaffold(
            appBar: AppBar(
              automaticallyImplyLeading: false,
              leading: InkWell(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: const Icon(Icons.arrow_back_sharp)),
              title: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    '${widget.data.teamShortName1} vs ${widget.data.teamShortName2}',
                    style: const TextStyle(
                        fontSize: 15, fontWeight: FontWeight.w600),
                  ),
                  Text('${TimeConvert.timeLeft(widget.data.time!)} left',
                      style: const TextStyle(
                          fontSize: 12, fontWeight: FontWeight.w400)),
                ],
              ),
              backgroundColor: Colors.black,
              bottom:  TabBar(
                labelColor: Colors.red,
                unselectedLabelColor: Colors.grey[100],
                indicatorColor: Colors.red,
                indicatorWeight: 5,
                indicatorPadding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
                labelStyle:
                const TextStyle(fontSize: 16, fontWeight: FontWeight.w700),
                tabs: const [
                  Tab(text: "Contests"),
                  Tab(text: "My Contest"),
                  Tab(text: "My Team"),
                ],
              ),
            ),
            body: TabBarView(children: [
              UpCoContestsTab(
                data: widget.data,
                teamId: '',
              ),
              UpCoMyContestsTab(
                data: widget.data,
              ),
              UpCoMyTeamsTab(
                data: widget.data,
              ),
            ]),
        )
    );
  }
}
