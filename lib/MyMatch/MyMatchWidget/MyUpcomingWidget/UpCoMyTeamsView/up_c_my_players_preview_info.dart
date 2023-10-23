import 'package:flutter/material.dart';
import 'package:dream11_pw/Model/my_match_model.dart';
import 'package:dream11_pw/Model/save_team_model.dart';


class UpCoPlayersPreviewInfo extends StatelessWidget {
  final PlayerInfo saveTeamModel;
  final MyMatchModel myMatchModel;
  const UpCoPlayersPreviewInfo({
    Key? key, required this.saveTeamModel, required this.myMatchModel
  }) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Column(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(5),
              child: CircleAvatar(
                backgroundImage: NetworkImage('${saveTeamModel.image}'),
                backgroundColor: Colors.white,
                radius: 25,
              ),
            ),
            Container(
              padding: const EdgeInsets.all(3),
              decoration: BoxDecoration(
                color: myMatchModel.teamShortName1 == saveTeamModel.teamShortName
                    ? Colors.black
                    : Colors.white,
                borderRadius: BorderRadius.circular(5),
              ),
              child: Text(
                '${saveTeamModel.name}',
                style: TextStyle(
                  fontSize: 6,
                  color:
                  myMatchModel.teamShortName1 == saveTeamModel.teamShortName
                      ? Colors.white
                      : Colors.black,
                ),
              ),
            ),
            Text('${saveTeamModel.creditPoints} cr.')
          ],
        ),
        Positioned(
          top: 0,
          right: 0,
          child: saveTeamModel.isCaptain == '1' || saveTeamModel.isViceCaptain == '1'
              ? CircleAvatar(
            backgroundColor: Colors.black,
            radius: 10,
            child: Text(saveTeamModel.isCaptain == '1'
                ? 'c'
                : saveTeamModel.isViceCaptain == '1'
                ? 'vc'
                : ''),
          )
              : Container(),
        )
      ],
    );
  }
}
