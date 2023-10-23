// ignore_for_file: library_private_types_in_public_api, depend_on_referenced_packages

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:dream11_pw/Model/my_match_model.dart';
import '../../../Api/api_controller.dart';
import '../../../Model/my_join_contest_list_live_model.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../../Provider/view_profile_provider.dart';

class MyJoinContestListLive extends StatefulWidget {
  final MyMatchModel liveMatches;
  const MyJoinContestListLive({super.key, required this.liveMatches});
  @override
  _MyJoinContestListLiveState createState() => _MyJoinContestListLiveState();
}

class _MyJoinContestListLiveState extends State<MyJoinContestListLive> {
  @override
  Widget build(BuildContext context) {
    final userData = Provider.of<ProfileViewProvider>(context).userData;
    return loading
        ? const Center(
            child: CircularProgressIndicator(
              color: Colors.grey,
            ),
          )
        : liveMatchContests.isEmpty
            ? const Center(child: Text('no data available'))
            : ListView(
                shrinkWrap: true,
                physics: const BouncingScrollPhysics(),
                children: [
                  ListView.builder(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      itemCount: liveMatchContests.length,
                      itemBuilder: (BuildContext context, int index) {
                        final data = liveMatchContests[index];
                        return Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Card(
                            elevation: 5,
                            child: SizedBox(
                              height: 136,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Container(
                                    color: Colors.white,
                                    child: Padding(
                                      padding: const EdgeInsets.fromLTRB(
                                          10, 15, 10, 10),
                                      child: Row(
                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text(
                                            '${data.contestName}',
                                            style: TextStyle(
                                                fontSize: 14,
                                                fontWeight: FontWeight.w400,
                                                color: Colors.grey[700]),
                                          ),
                                          Text(
                                            '${data.totalTeam} Spots',
                                            style: TextStyle(
                                                fontSize: 14,
                                                fontWeight: FontWeight.w400,
                                                color: Colors.grey[700]),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                  Container(
                                    color: Colors.grey[100],
                                    child: Padding(
                                      padding: const EdgeInsets.fromLTRB(
                                          10, 15, 10, 10),
                                      child: Row(
                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text(
                                            'Glory awaits!',
                                            style: TextStyle(
                                                fontSize: 14,
                                                fontWeight: FontWeight.w400,
                                                color: Colors.grey[700]),
                                          ),
                                          Text(
                                            'Guaranteed',
                                            style: TextStyle(
                                                fontSize: 14,
                                                fontWeight: FontWeight.w400,
                                                color: Colors.grey[700]),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                  Container(
                                    color: Colors.orange.withOpacity(0.05),
                                    child: Padding(
                                      padding: const EdgeInsets.fromLTRB(
                                          10, 17, 10, 15),
                                      child: Row(
                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text(
                                      userData==null?'':'${userData.referralCode}',
                                            style: TextStyle(
                                                fontSize: 14,
                                                fontWeight: FontWeight.w400,
                                                color: Colors.grey[700]),
                                          ),
                                          Row(
                                            children: [
                                              Text(data.teamName.toString().substring(0).replaceAll(RegExp('eam '),''),
                                                style: TextStyle(
                                                    fontSize: 14,
                                                    fontWeight: FontWeight.w400,
                                                    color: Colors.grey[700])),
                                              const SizedBox(width: 10),
                                              Text('${data.points}',
                                                style: TextStyle(
                                                    fontSize: 14,
                                                    fontWeight: FontWeight.w400,
                                                    color: Colors.grey[700]))
                                            ],
                                          ),
                                          Text(
                                            '#${data.rank} -',
                                            style: TextStyle(
                                                fontSize: 14,
                                                fontWeight: FontWeight.w400,
                                                color: Colors.grey[700]),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        );
                      }),
                ],
              );
  }

  List<MyJoinContestListLiveModel> liveMatchContests = [];

  @override
  void initState() {
    super.initState();
    fetchData();
  }

  bool loading = true;
  Future<void> fetchData() async {
    final prefs = await SharedPreferences.getInstance();
    final userid = prefs.getString("userid");
    try {
      List<MyJoinContestListLiveModel> matchLiveContest =
          await ApiController.fetchMyJoinLiveContest(
              widget.liveMatches.matchId.toString(), userid.toString());
      setState(() {
        liveMatchContests = matchLiveContest;
      });
    } catch (e) {
      if (kDebugMode) {
        print('Error fetching upcoming matches: $e');
      }
    } finally {
      setState(() {
        loading = false;
      });
    }
  }
}
