// ignore_for_file: depend_on_referenced_packages, use_build_context_synchronously

import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:dream11_pw/Model/my_match_model.dart';
import 'package:dream11_pw/Model/player_list_model.dart';
import 'package:dream11_pw/Constant/api_url.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import 'package:dream11_pw/Utils/utils.dart';

import '../up_c_tab_bar.dart';

class ChooseCaptainAndViceCaptain extends StatefulWidget {
  final List<PlayerListModel> selectedPlayers;
  final MyMatchModel myMatchModel;

  const ChooseCaptainAndViceCaptain(
      {super.key, required this.selectedPlayers, required this.myMatchModel});

  @override
  State<ChooseCaptainAndViceCaptain> createState() =>
      _ChooseCaptainAndViceCaptainState();
}

class _ChooseCaptainAndViceCaptainState
    extends State<ChooseCaptainAndViceCaptain> {
  String cid = '';
  String vid = '';
  final int a = 1;

  @override
  Widget build(BuildContext context) {
    final heights = MediaQuery.of(context).size.height;
    final widths = MediaQuery.of(context).size.width;
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.red,
          leading: IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: const Icon(Icons.arrow_back)),
          title: Text(
            'Create Team ',
            style: TextStyle(fontSize: heights / 45),
          ),
        ),
        body: ListView(
          children: [
            SizedBox(
              height: heights / 9,
              width: widths,
              // color: Colors.blue,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  SizedBox(
                    height: heights / 50,
                  ),
                  Text(
                    'Choose Your Captain and Vice Captain',
                    style: TextStyle(
                        fontWeight: FontWeight.bold, fontSize: heights / 50),
                  ),
                  Text(
                    'C gets 2x points and VC gets 1.5x points',
                    style: TextStyle(fontSize: heights / 55),
                  ),
                  SizedBox(
                    height: heights / 30,
                  ),
                ],
              ),
            ),
            Container(
              height: heights / 18,
              width: widths,
              color: Colors.red,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text(
                    'Type',
                    style: TextStyle(
                        fontWeight: FontWeight.bold, fontSize: heights / 45),
                  ),
                  Text(
                    'Points',
                    style: TextStyle(
                        fontWeight: FontWeight.bold, fontSize: heights / 45),
                  ),
                  Text(
                    '% C By',
                    style: TextStyle(fontSize: heights / 50),
                  ),
                  Text(
                    '% VC By',
                    style: TextStyle(fontSize: heights / 50),
                  ),
                ],
              ),
            ),
            ListView.builder(
                itemCount: 11,
                physics: const BouncingScrollPhysics(),
                shrinkWrap: true,
                itemBuilder: (context, index) {
                  return Column(
                    children: <Widget>[
                      ListTile(
                        title: Text(
                          '${widget.selectedPlayers[index].name}',
                          style: TextStyle(
                              fontSize: heights / 55,
                              fontWeight: FontWeight.bold),
                        ),
                        subtitle: Text(
                          '${widget.selectedPlayers[index].points} pts',
                          style: TextStyle(
                              fontSize: heights / 70,
                              fontWeight: FontWeight.bold),
                        ),
                        //tileColor: Colors.white,
                        leading: Column(
                          children: [
                            CircleAvatar(
                              backgroundColor: Colors.white,
                              radius: 20,
                              backgroundImage: NetworkImage(
                                  '${widget.selectedPlayers[index].image}'),
                            ),
                            Container(
                              alignment: Alignment.center,
                              width: 60,
                              child: Text(
                                '${widget.selectedPlayers[index].teamName}',
                                maxLines: 1,
                                style: TextStyle(
                                    fontSize: heights / 90,
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                          ],
                        ),
                        trailing: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: <Widget>[
                            GestureDetector(
                              onTap: () {
                                setState(() {
                                  if (vid != widget.selectedPlayers[index].id ||
                                      vid == '') {
                                    cid = '${widget.selectedPlayers[index].id}';
                                  }
                                });
                              },
                              child: CircleAvatar(
                                backgroundColor:
                                    cid == widget.selectedPlayers[index].id
                                        ? Colors.red
                                        : Colors.grey[300],
                                child: const Text(
                                  'C',
                                  style: TextStyle(
                                    color: Colors.black,
                                  ),
                                ),
                              ),
                            ),
                            const SizedBox(width: 55),
                            GestureDetector(
                              onTap: () {
                                setState(() {
                                  if (cid != widget.selectedPlayers[index].id ||
                                      cid == '') {
                                    vid = '${widget.selectedPlayers[index].id}';
                                  }
                                });
                              },
                              child: CircleAvatar(
                                backgroundColor:
                                    vid == widget.selectedPlayers[index].id
                                        ? Colors.red
                                        : Colors.grey[300],
                                child: const Text(
                                  'VC',
                                  style: TextStyle(
                                    color: Colors.black,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      const Divider()
                    ],
                  );
                }),
          ],
        ),
        bottomNavigationBar: SizedBox(
          height: 40,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const SizedBox(),
              InkWell(
                onTap: () async {
                  if (cid == '' && vid == '') {
                    Utils.showToast('Select Captain and Vice-Captain');
                  } else {
                    saveTeam();
                  }
                },
                child: Container(
                  // height: heights/5,
                  width: 200,
                  decoration: BoxDecoration(
                      color: Colors.red,
                      borderRadius: BorderRadius.circular(10)),
                  child: const Center(
                      child: Text(
                    'Save Team',
                    style: TextStyle(color: Colors.white),
                  )),
                ),
              ),
              const SizedBox(),
            ],
          ),
        ));
  }

  Future<void> saveTeam() async {
    final prefs = await SharedPreferences.getInstance();
    final userid = prefs.getString("userid");
    final url = Uri.parse(ApiUrl.saveTeam);
    List playerSelected = [];
    playerSelected.clear();
    for (var i = 0; i < widget.selectedPlayers.length; i++) {
      playerSelected.add({"PlayerId": widget.selectedPlayers[i].id.toString()});
    }

    final res = await http.post(url,
        headers: <String, String>{
          'content-Type': 'application/json; charset=UTF-8',
        },
        body: jsonEncode({
          "matchid": widget.myMatchModel.matchId,
          "userid": userid,
          "CaptainId": cid,
          "ViceCaptainId": vid,
          "PlayerList": playerSelected,
          "edit": "0"
        }));
    final response = jsonDecode(res.body);
    if (response['responsecode'] != 200) {
      final msg = response['message'];
      Utils.showToast(msg.toString());
      Navigator.pushReplacement(
          context,
          MaterialPageRoute(
              builder: (context) => UpCoTabBar(
                    data: widget.myMatchModel,
                  )));
    } else {
      debugPrint('Something went wrong');
    }
  }
}
