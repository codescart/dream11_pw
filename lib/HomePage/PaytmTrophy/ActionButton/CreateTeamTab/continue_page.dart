// ignore_for_file: depend_on_referenced_packages, use_build_context_synchronously

import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:dream11_pw/Model/player_list_model.dart';
import 'package:dream11_pw/Model/cricket_matches_model.dart';
import 'package:dream11_pw/Constant/api_url.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

import '../../../../Home/HomeWidget/CricketTabs/cricket_tabs.dart';

class SaveTeam extends StatefulWidget {
  final List<PlayerListModel> team;
  final CricketMatchesModel match;

  const SaveTeam({
    super.key,
    required this.team,
    required this.match,
  });

  @override
  State<SaveTeam> createState() => _SaveTeamState();
}

class _SaveTeamState extends State<SaveTeam> {
  String cid = '';
  String vid = '';
  final int a = 1;

  //final _auth = FirebaseAuth.instance;
  late String messageText;

  void showToast(String message) {
    Fluttertoast.showToast(
        msg: message,
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
        backgroundColor: Colors.blueAccent,
        textColor: Colors.black);
  }

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
                          '${widget.team[index].name}',
                          style: TextStyle(
                              fontSize: heights / 55,
                              fontWeight: FontWeight.bold),
                        ),
                        subtitle: Text(
                          '${widget.team[index].points} pts',
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
                              backgroundImage:
                                  NetworkImage('${widget.team[index].image}'),
                            ),
                            Container(
                              alignment: Alignment.center,
                              width: 60,
                              child: Text(
                                '${widget.team[index].teamName}',
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
                                  if (vid != widget.team[index].id ||
                                      vid == '') {
                                    cid = '${widget.team[index].id}';
                                  }
                                });
                              },
                              child: CircleAvatar(
                                backgroundColor: cid == widget.team[index].id
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
                                  if (cid != widget.team[index].id ||
                                      cid == '') {
                                    vid = '${widget.team[index].id}';
                                  }
                                });
                              },
                              child: CircleAvatar(
                                backgroundColor: vid == widget.team[index].id
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
                    showToast('Select Captain and Vice-Captain');
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
    for (var i = 0; i < widget.team.length; i++) {
      playerSelected.add({"PlayerId": widget.team[i].id.toString()});
    }

    final res = await http.post(url,
        headers: <String, String>{
          'content-Type': 'application/json; charset=UTF-8',
        },
        body: jsonEncode({
          "matchid": widget.match.matchId,
          "userid": userid,
          "CaptainId": cid,
          "ViceCaptainId": vid,
          "PlayerList": playerSelected,
          "edit": "0"
        }));
    final response = jsonDecode(res.body);
    if (response['responsecode'] != 200) {
      final msg = response['message'];
      showToast(msg.toString());
      Navigator.pushReplacement(
          context,
          MaterialPageRoute(
              builder: (context) =>
                  CricketTabs(data: widget.match, tabIndex: 2)));
    } else {
      debugPrint('Something went wrong');
    }
  }
}
