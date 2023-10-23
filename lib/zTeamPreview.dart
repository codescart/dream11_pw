import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:dream11_pw/Model/player_list_model.dart';
import 'package:dream11_pw/Model/cricket_matches_model.dart';

class Team_preview extends StatelessWidget {
  final List<PlayerListModel> team;
  final CricketMatchesModel match;


  Team_preview(
      {required this.team,
        required this.match, });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green[700],
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(Icons.arrow_back),
        ),
        title: Text(
          'Team Preview',
          // style: GoogleFonts.mcLaren(),
        ),
        centerTitle: true,
      ),
      body: Container(
        constraints: BoxConstraints.expand(),
        decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage("assets/images/cricketpitch.jpg"),
              fit: BoxFit.cover),
        ),
        child: Padding(
          padding: const EdgeInsets.all(5.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              Text(
                'Wicketkeeper',
                // style: GoogleFonts.mcLaren(),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  for (int i = 0; i < team.length; i++)
                    if(team[i].designationId=='4')
                    player_icon(playerimg: '${team[i].image}', name: '${team[i].name}', player_type: 'wk',),
                ],
              ),
              SizedBox(height: 8),
              Text(
                'Batsmen',
                // style: GoogleFonts.mcLaren()
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  for (int i = 0; i < team.length; i++)
                    if(team[i].designationId=='1')
                      player_icon(playerimg: '${team[i].image}', name: '${team[i].name}', player_type: 'bat',),
                ],
              ),
              SizedBox(height: 8),
              Text(
                'All-rounders',
                // style: GoogleFonts.mcLaren()
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  for (int i = 0; i < team.length; i++)
                    if(team[i].designationId=='3')
                      player_icon(playerimg: '${team[i].image}', name: '${team[i].name}', player_type: 'Al',),
                ],
              ),
              SizedBox(height: 8),
              Text(
                'Bowlers',
                // style: GoogleFonts.mcLaren()
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  for (int i = 0; i < team.length; i++)
                    if(team[i].designationId=='2')
                      player_icon(playerimg: '${team[i].image}', name: '${team[i].name}', player_type: 'Bowl',),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class player_icon extends StatelessWidget {
  const player_icon({
    Key? key,
    required this.playerimg,
    required this.name,
    required this.player_type,
  }) : super(key: key);

  final String playerimg;
  final String name;
  final String player_type;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Padding(
          padding: EdgeInsets.all(5),
          child: CircleAvatar(
            backgroundImage: NetworkImage(playerimg),
            backgroundColor: Colors.white,
            radius: 20,
          ),
        ),
        Container(
          padding: EdgeInsets.all(3),
          decoration: BoxDecoration(
            color: Colors.black,
            borderRadius: BorderRadius.circular(5),
          ),
          child: Text(
            name,
            style: TextStyle(
              fontSize: 6,
              color: Colors.white,
            ),
          ),
        ),
      ],
    );
  }
}
