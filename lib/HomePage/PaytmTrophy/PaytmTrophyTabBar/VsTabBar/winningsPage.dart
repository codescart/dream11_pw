import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:dream11_pw/Model/winning_contest_model.dart';
import 'package:dream11_pw/Model/cricket_matches_model.dart';
import 'package:dream11_pw/Constant/api_url.dart';
import 'package:http/http.dart'as http;

import '../../../../Model/contest_model.dart';

class WinningssPage extends StatefulWidget {
  final  CricketMatchesModel match;
  final ContestModel contest;
  WinningssPage({
    required this.match,
    required this.contest,
});

  @override
  State<WinningssPage> createState() => _WinningssPageState();
}

class _WinningssPageState extends State<WinningssPage> {

  BorderRadius radius = const BorderRadius.only(
    topLeft: Radius.circular(24),
    topRight: Radius.circular(24),
  );
  @override
  Widget build(BuildContext context) {
    final heights=MediaQuery.of(context).size.height;
    final widths=MediaQuery.of(context).size.width;
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
         Padding(
           padding:EdgeInsets.only(left:widths/50 ),
           child: Text('Be the first n your network to join this contest.'),
         ),
          Divider(
            color: Colors.grey,thickness: 1,
          ),
          Padding(
            padding: EdgeInsets.only(left: heights/60,right: heights/60),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('Rank',style: TextStyle(fontSize: heights/50),),
                Text('Winnings',style: TextStyle(fontSize: heights/50),),
              ],
            ),
          ),
          Divider(
            color: Colors.grey,thickness: 1,
          ),
          FutureBuilder<List<WinningContestModel>>(
              future: que(),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return Center(
                    child: CircularProgressIndicator(),
                  );
                }
                else if (snapshot.hasError) {
                  return Center(
                    child: Text('Error: ${snapshot.error}'),
                  );
                }
                else if (!snapshot.hasData || snapshot.data!.isEmpty) {
                  return Center(
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
                                  Text('#'+'${snapshot.data![index].rank}',style: TextStyle(fontWeight: FontWeight.bold,fontSize: heights/40),),
                                  Text('Rs.'+'${snapshot.data![index].price}',style: TextStyle(fontWeight: FontWeight.bold,fontSize: heights/40),),
                                ],
                              ),
                            ),
                            Divider(
                              color: Colors.grey,thickness: 1,
                            ),
                          ],
                        );
                      });
                }
              }
          ),

        ],
      ),
    );
  }
  Future<List<WinningContestModel>> que()  async {
    final response = await http.post(Uri.parse(ApiUrl.winningInfo),
        headers: <String,String>{
          'content-Type':'application/json; charset=UTF-8',
        },
        body:jsonEncode(<String,String>{
          "contest_id":'${widget.contest.contestId}'
        })
    );
    if (response.statusCode == 200) {
      final jsonData = json.decode(response.body)['data'] as List<dynamic>;
      return jsonData.map((item) => WinningContestModel.fromJson(item)).toList();
    } else {
      throw Exception('Failed to load data');
    }
  }
}
