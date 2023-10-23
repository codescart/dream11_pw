// ignore_for_file: depend_on_referenced_packages, use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:step_progress_indicator/step_progress_indicator.dart';
import 'package:dream11_pw/HomePage/PaytmTrophy/ActionButton/CreateTeamTab/create_team_tab_bar.dart';
import 'package:dream11_pw/HomePage/PaytmTrophy/PaytmTrophyTabBar/VsTabBar/leaderboardPage.dart';
import 'package:dream11_pw/HomePage/PaytmTrophy/PaytmTrophyTabBar/VsTabBar/winningsPage.dart';
import 'package:dream11_pw/Model/cricket_matches_model.dart';
import '../../../../Api/Api_controller/walletApi.dart';
import '../../../../Api/api_controller.dart';
import '../../../../DrawerContent/WalletItem/add_cash.dart';
import '../../../../Model/contest_model.dart';
import '../../../../Provider/view_profile_provider.dart';

class CountryTabPage extends StatefulWidget {
  final CricketMatchesModel match;
  final ContestModel contest;
  final String teamId;
  const CountryTabPage({
    super.key,
    required this.match,
    required this.contest,
    required this.teamId,
  });

  @override
  State<CountryTabPage> createState() => _CountryTabPageState();
}

class _CountryTabPageState extends State<CountryTabPage>
    with TickerProviderStateMixin {
  // double percent = 0.0;
  // int dataM = 0;
  @override
  Widget build(BuildContext context) {
    final userData = Provider.of<ProfileViewProvider>(context).userData;
    TabController tabController = TabController(length: 2, vsync: this);
    final heights = MediaQuery.of(context).size.height;
    final widths = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        leading: InkWell(
            onTap: () {
              Navigator.pop(context);
            },
            child: const Icon(Icons.arrow_back)),
        title: Text('${widget.match.title}'),
        backgroundColor: Colors.red,
      ),
      body: Column(
        children: [
          SizedBox(
            height: heights / 4,
            width: widths,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: EdgeInsets.only(left: widths / 50),
                  child: Text(
                    'Prize Pool',
                    style:
                        TextStyle(color: Colors.grey, fontSize: heights / 55),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(left: widths / 50),
                  child: Text(
                    'Rs.${widget.contest.prizePool}',
                    style: TextStyle(
                        fontWeight: FontWeight.bold, fontSize: heights / 45),
                  ),
                ),
                Padding(
                  padding:
                      EdgeInsets.only(left: heights / 70, right: heights / 70),
                  child: StepProgressIndicator(
                    totalSteps: int.parse(widget.contest.totalTeam.toString()),
                    currentStep: int.parse(widget.contest.remainingTeam.toString()),
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
                      EdgeInsets.only(left: widths / 50, right: widths / 50),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        '${widget.contest.remainingTeam} spot left',
                        style: const TextStyle(color: Colors.red),
                      ),
                      Text(
                        '${widget.contest.totalTeam} spot',
                        style: const TextStyle(color: Colors.red),
                      )
                    ],
                  ),
                ),
                Center(
                  child: InkWell(
                    onTap: () {
                      widget.teamId == ''
                          ? Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => CreateTeamTapBarPage(
                                      match: widget.match)))
                          : showDialog(
                              barrierColor: Colors.transparent,
                              context: context,
                              builder: (context) => AlertDialog(
                                    shape: const RoundedRectangleBorder(
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(20))),
                                    backgroundColor: Colors.white,
                                    content: Container(
                                      height: heights / 3.5,
                                      width: widths / 1.5,
                                      decoration: BoxDecoration(
                                          color: Colors.white,
                                          borderRadius:
                                              BorderRadius.circular(30)),
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceEvenly,
                                        children: [
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              const Text(
                                                'Confirmation',
                                                style: TextStyle(
                                                    fontWeight: FontWeight.bold,
                                                    color: Colors.red),
                                              ),
                                              InkWell(
                                                  onTap: () {
                                                    Navigator.pop(context);
                                                  },
                                                  child:
                                                      const Icon(Icons.close))
                                            ],
                                          ),
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              const Text(
                                                'Entry',
                                                style: TextStyle(
                                                    fontWeight:
                                                        FontWeight.bold),
                                              ),
                                              Text(
                                                'Rs.${widget.contest.entry}',
                                                style: const TextStyle(
                                                    color: Colors.red),
                                              ),
                                            ],
                                          ),
                                          const Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              Text('Cash Bonus',
                                                  style: TextStyle(
                                                      fontWeight:
                                                          FontWeight.bold)),
                                              Text(
                                                '-Rs.0',
                                                style: TextStyle(
                                                    color: Colors.red),
                                              ),
                                            ],
                                          ),
                                          Divider(
                                            indent: heights / 30,
                                            endIndent: heights / 30,
                                            color: Colors.black26,
                                          ),
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              const Text('To Pay',
                                                  style: TextStyle(
                                                      fontWeight:
                                                          FontWeight.bold)),
                                              Text(
                                                'Rs.${widget.contest.entry}',
                                                style: const TextStyle(
                                                    color: Colors.red),
                                              ),
                                            ],
                                          ),
                                          InkWell(
                                            onTap: () {
                                                if (int.parse(total_amount.toString()) >
                                                    int.parse(widget.contest.entry.toString())) {
                                                  ApiController.joinContest(
                                                      context,
                                                      widget.contest,
                                                      widget.match,
                                                      widget.teamId,
                                                      userData!.referralCode.toString(),
                                                      userData.image.toString(),
                                                  );
                                                } else {
                                                  Navigator.push(context,
                                                      MaterialPageRoute(builder: (context) => const AddCash()));
                                                }
                                              // joinContest(userData!.referralCode.toString(),userData.image.toString());
                                            },
                                            child: Container(
                                              height: heights / 20,
                                              width: widths / 2,
                                              decoration: BoxDecoration(
                                                  color: Colors.red,
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          10)),
                                              child: const Center(
                                                child: Text(
                                                  'Join Contest',
                                                  style: TextStyle(
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      color: Colors.white),
                                                ),
                                              ),
                                            ),
                                          )
                                        ],
                                      ),
                                    ),
                                  ));
                    },
                    child: Container(
                      height: heights / 22,
                      width: widths / 1.1,
                      decoration: BoxDecoration(
                          color: Colors.red,
                          borderRadius: BorderRadius.circular(10)),
                      child: Center(
                          child: Text(
                        widget.contest.entry == '0'
                            ? 'Join'
                            : 'Join ₹ ${widget.contest.entry}',
                        style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: heights / 40),
                      )),
                    ),
                  ),
                ),
                Container(
                  height: heights / 18,
                  width: widths,
                  color: Colors.grey[200],
                  child: Padding(
                    padding: EdgeInsets.only(
                        left: heights / 50, right: heights / 50),
                    child: const Row(
                      children: [
                        Icon(
                          Icons.info_outline,
                          color: Colors.red,
                        ),
                        Spacer(),
                        Icon(
                          Icons.check_circle_outline_rounded,
                          color: Colors.red,
                        ),
                      ],
                    ),
                  ),
                ),
                TabBar(
                  controller: tabController,
                  labelColor: Colors.black,
                  unselectedLabelColor: Colors.grey,
                  tabs: const [
                    Tab(
                      text: "Winnings",
                    ),
                    Tab(text: "Leaderboard"),
                  ],
                ),
              ],
            ),
          ),
          SizedBox(
            height: heights / 1.58,
            width: widths,
            child: TabBarView(controller: tabController, children: [
              WinningssPage(
                match: widget.match,
                contest: widget.contest,
              ),
              LeadershipPage(
                match: widget.match,
                contest: widget.contest,
              ),
            ]),
          ),
        ],
      ),
    );
  }

  // joinContest(String referralCode, String image) async {
  //   final prefs = await SharedPreferences.getInstance();
  //   final userid = prefs.getString("userid");
  //   final res = await http.post(Uri.parse(ApiUrl.joinContest),
  //       headers: <String, String>{
  //         'content-Type': 'application/json; charset=UTF-8',
  //       },
  //       body: jsonEncode(<String, String>{
  //         "user_id": userid.toString(),
  //         "my_team_id": widget.teamId,
  //         "name": widget.contest.contestName.toString(),
  //         "contest_amount": widget.contest.entry.toString(),
  //         "match_id": widget.contest.matchId.toString(),
  //         "TeamName": referralCode,
  //         "image": image,
  //         "contest_id": widget.contest.contestId.toString()
  //       }));
  //   final response = jsonDecode(res.body);
  //   if (res.statusCode == 200) {
  //     if (response['status'] == 'success') {
  //       Navigator.pushReplacement(
  //           context,
  //           MaterialPageRoute(
  //               builder: (context) =>
  //                   CricketTabs(teamId: '', data: widget.match, tabIndex: 1)));
  //      return Utils.showToast(response['message'].toString());
  //     } else {
  //      return Utils.showToast(response['message'].toString());
  //     }
  //   } else {
  //     throw Exception('Server error');
  //   }
  // }
}
