import 'package:flutter/material.dart';
import 'package:dream11_pw/Model/save_team_model.dart';
import 'package:dream11_pw/Model/cricket_matches_model.dart';

class PlayerPreviewInfo extends StatelessWidget {
  const PlayerPreviewInfo({
    Key? key,
    required this.data,
    required this.upcomingTeamCricket,
  }) : super(key: key);
  final PlayerInfo data;
  final CricketMatchesModel upcomingTeamCricket;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Column(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(5),
              child: CircleAvatar(
                backgroundImage: NetworkImage('${data.image}'),
                backgroundColor: Colors.white,
                radius: 25,
              ),
            ),
            Container(
              padding: const EdgeInsets.all(3),
              decoration: BoxDecoration(
                color: upcomingTeamCricket.teamShortName1 == data.teamShortName
                    ? Colors.black
                    : Colors.white,
                borderRadius: BorderRadius.circular(5),
              ),
              child: Text(
                '${data.name}',
                style: TextStyle(
                  fontSize: 6,
                  color:
                      upcomingTeamCricket.teamShortName1 == data.teamShortName
                          ? Colors.white
                          : Colors.black,
                ),
              ),
            ),
            Text('${data.creditPoints} cr.')
          ],
        ),
        Positioned(
          top: 0,
          right: 0,
          child: data.isCaptain == '1' || data.isViceCaptain == '1'
              ? CircleAvatar(
                  backgroundColor: Colors.black,
                  radius: 10,
                  child: Text(data.isCaptain == '1'
                      ? 'c'
                      : data.isViceCaptain == '1'
                          ? 'vc'
                          : ''),
                )
              : Container(),
        )
      ],
    );
  }
}
