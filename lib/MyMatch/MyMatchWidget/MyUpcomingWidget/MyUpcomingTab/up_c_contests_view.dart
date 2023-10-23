import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:dream11_pw/Model/join_contest_model.dart';
import 'package:dream11_pw/Model/my_match_model.dart';
import 'package:dream11_pw/generated/assets.dart';
import '../../../../Provider/view_profile_provider.dart';
import 'up_c_player_preview_Info.dart';

class UpCoContestView extends StatelessWidget {
  final JoinContestModel joinContestList;
  final MyMatchModel? myMatchModel;
  const UpCoContestView(
      {super.key, required this.joinContestList, this.myMatchModel});
  @override
  Widget build(BuildContext context) {
    final userData = Provider.of<ProfileViewProvider>(context).userData;
    double credit = 0;
    for (var cr in joinContestList.playerInfo!) {
      credit = credit + double.parse(cr.creditPoints.toString());
    }
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.grey[800],
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(Icons.close),
        ),
        actions: [
          IconButton(
            onPressed: () {
              // Navigator.push(
              // context,
              // MaterialPageRoute(
              //     builder: (context) => CreateTeamTapBarPage(
              //         match: upcomingTeamCricket,
              //         saveTeamModel: saveTeamModel)));
            },
            icon: const Icon(Icons.edit),
          ),
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.add),
          )
        ],
        title: Row(
          children: [
            Text(
              userData==null?'':'${userData.referralCode}',
            ),
            Container(
              color: Colors.grey[900],
              margin: const EdgeInsets.fromLTRB(5, 0, 0, 0),
              padding: const EdgeInsets.fromLTRB(3, 3, 3, 3),
              child: Text(
                joinContestList.teamNumber.toString(),
                style: const TextStyle(fontSize: 12),
              ),
            )
          ],
        ),
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(50),
          child: Container(
            color: Colors.grey[800],
            height: 50,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Column(
                  children: [
                    Text(
                      'Players',
                      style: TextStyle(
                          color: Colors.grey[900], fontWeight: FontWeight.w600),
                    ),
                    Text(
                      '${joinContestList.bowler! + joinContestList.allRounder! + joinContestList.batsman! + joinContestList.wicketKeeper!}/11',
                      style: const TextStyle(
                          color: Colors.white, fontWeight: FontWeight.w600),
                    ),
                  ],
                ),
                Row(
                  children: [
                    Container(
                      margin: const EdgeInsets.fromLTRB(0, 0, 10, 0),
                      padding: const EdgeInsets.fromLTRB(10, 2, 10, 2),
                      color: Colors.black,
                      child: Text(
                        joinContestList.team1![0].teamShortName.toString(),
                        style: const TextStyle(
                            color: Colors.white, fontWeight: FontWeight.w600),
                      ),
                    ),
                    const SizedBox(
                      width: 5,
                    ),
                    Text(
                      joinContestList.team1![0].teamCount.toString(),
                      style: const TextStyle(
                          color: Colors.white, fontWeight: FontWeight.w600),
                    ),
                    const Text(
                      '  :  ',
                      style: TextStyle(
                          color: Colors.grey, fontWeight: FontWeight.w800),
                    ),
                    Text(
                      joinContestList.team2![0].teamCount.toString(),
                      style: const TextStyle(
                          color: Colors.white, fontWeight: FontWeight.w600),
                    ),
                    Container(
                      margin: const EdgeInsets.fromLTRB(10, 0, 0, 0),
                      padding: const EdgeInsets.fromLTRB(10, 2, 10, 2),
                      color: Colors.white,
                      child: Text(
                        joinContestList.team2![0].teamShortName.toString(),
                        style: const TextStyle(
                            color: Colors.black, fontWeight: FontWeight.w600),
                      ),
                    ),
                  ],
                ),
                Column(
                  children: [
                    Text(
                      'Credits Left',
                      style: TextStyle(
                          color: Colors.grey[900], fontWeight: FontWeight.w600),
                    ),
                    Text(
                      (100 - credit).toString(),
                      style: const TextStyle(
                          color: Colors.white, fontWeight: FontWeight.w600),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
      body: Container(
        height: double.infinity,
        width: double.infinity,
        constraints: const BoxConstraints.expand(),
        decoration: const BoxDecoration(
          image: DecorationImage(
              image: AssetImage(Assets.imagesCricketPitch), fit: BoxFit.cover),
        ),
        child: Padding(
          padding: const EdgeInsets.all(5.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              const Text(
                'Wicketkeeper',
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  for (var data in joinContestList.playerInfo!)
                    if (data.designationId == '4')
                      UpCoPlayerPreviewInfo(
                          playerInfo: data,
                          myMatchModel: myMatchModel
                      )
                ],
              ),
              const SizedBox(height: 8),
              const Text(
                'Batsmen',
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  for (var data in joinContestList.playerInfo!)
                    if (data.designationId == '1')
                      UpCoPlayerPreviewInfo(
                          playerInfo: data, myMatchModel: myMatchModel)
                ],
              ),
              const SizedBox(height: 8),
              const Text(
                'All-rounders',
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  for (var data in joinContestList.playerInfo!)
                    if (data.designationId == '3')
                      UpCoPlayerPreviewInfo(
                          playerInfo: data, myMatchModel: myMatchModel)
                ],
              ),
              const SizedBox(height: 8),
              const Text(
                'Bowlers',
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  for (var data in joinContestList.playerInfo!)
                    if (data.designationId == '2')
                      UpCoPlayerPreviewInfo(
                          playerInfo: data, myMatchModel: myMatchModel)
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
