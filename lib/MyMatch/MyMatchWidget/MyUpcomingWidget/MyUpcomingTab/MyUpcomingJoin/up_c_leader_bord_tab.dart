// ignore_for_file: depend_on_referenced_packages

import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:dream11_pw/Api/Api_controller/leaderboard.dart';
import 'package:dream11_pw/Model/contest_model.dart';
import 'package:dream11_pw/Constant/api_url.dart';
import 'package:http/http.dart'as http;
import 'package:dream11_pw/Model/my_match_model.dart';


class UpCoLeaderBordTab extends StatefulWidget {
  final MyMatchModel myMatchModel;
  final ContestModel contestModel;

  const UpCoLeaderBordTab({super.key,  required this.myMatchModel, required this.contestModel});

  @override
  State<UpCoLeaderBordTab> createState() => _UpCoLeaderBordTabState();
}

class _UpCoLeaderBordTabState extends State<UpCoLeaderBordTab> {
  @override
  Widget build(BuildContext context)  {
    final heights=MediaQuery.of(context).size.height;
    // final widths=MediaQuery.of(context).size.width;
    return ListView(
      children: [
        const Padding(
          padding:EdgeInsets.fromLTRB(15, 5, 15, 5),
          child: Text('Be the first n your network to join this contest.'),
        ),
        const Divider(
          color: Colors.grey,thickness: 1,
        ),
        Padding(
            padding: EdgeInsets.only(left: heights/60),
            child: const Text('All Teams(89)')
        ),
        const Divider(
          color: Colors.grey,thickness: 1,
        ),
        FutureBuilder<List<leaderbord>>(
            future: que(),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              }
              else if (snapshot.hasError) {
                return Center(
                  child: Text('Error: ${snapshot.error}'),
                );
              }
              else if (!snapshot.hasData || snapshot.data!.isEmpty) {
                return const Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [

                      Text(
                        "No Contest History",
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 25,
                            color: Colors.black
                        ),
                      ),
                    ],
                  ),
                );
              }
              else {
                return ListView.builder(
                    itemCount: snapshot.data!.length,
                    scrollDirection: Axis.vertical,
                    shrinkWrap: true,
                    itemBuilder: (BuildContext context, int index) {
                      return  Column(
                        children: [
                          Padding(
                            padding:EdgeInsets.only(left:heights/50,right:heights/50),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                CircleAvatar(
                                  backgroundColor: Colors.transparent,
                                  radius:heights/40,
                                  backgroundImage: NetworkImage(snapshot.data![index].image),),
                                Text('Rs.60000',style: TextStyle(fontWeight: FontWeight.bold,fontSize: heights/40),),
                              ],
                            ),
                          ),
                          const Divider(
                            color: Colors.grey,thickness: 1,
                          ),
                        ],
                      );
                    });
              }
            }
        ),

      ],
    );
  }
  Future<List<leaderbord>> que()  async {
    final response = await http
        .post(Uri.parse(ApiUrl.leaderboard),
        headers: <String,String>{
          'content-Type':'application/json; charset=UTF-8',
        },
        body:jsonEncode(<String,String>{
          "matchid":'${widget.myMatchModel.matchId}'
        })
    );
    if (response.statusCode == 200) {
      final jsonData = json.decode(response.body)['data'] as List<dynamic>;
      return jsonData.map((item) => leaderbord.fromJson(item)).toList();
    } else {
      throw Exception('Failed to load data');
    }
  }
}
