import 'package:flutter/material.dart';
import 'package:dream11_pw/Model/join_contest_model.dart';
import 'package:dream11_pw/Model/my_match_model.dart';

class UpCoPlayerPreviewInfo extends StatelessWidget {
  final PlayerInfo playerInfo;
  final MyMatchModel? myMatchModel;
  const UpCoPlayerPreviewInfo({super.key, required this.playerInfo, required this.myMatchModel });
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Column(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(5),
              child: CircleAvatar(
                backgroundImage: NetworkImage('${playerInfo.image}'),
                backgroundColor: Colors.white,
                radius: 25,
              ),
            ),
            Container(
              padding: const EdgeInsets.all(3),
              decoration: BoxDecoration(
                color:
                // myMatchModel!.teamShortName1 == playerInfo.teamShortName
                //     ?
                Colors.black,
                    // : Colors.white,
                borderRadius: BorderRadius.circular(5),
              ),
              child: Text(
                '${playerInfo.name}',
                style: const TextStyle(
                  fontSize: 6,
                  color:
                  // myMatchModel!.teamShortName1 == playerInfo.teamShortName
                  //     ?
                  Colors.white,
                      // : Colors.black,
                ),
              ),
            ),
            Text('${playerInfo.creditPoints} cr.')
          ],
        ),
        Positioned(
          top: 0,
          right: 0,
          child: playerInfo.isCaptain == '1' || playerInfo.isViceCaptain == '1'
              ? CircleAvatar(
            backgroundColor: Colors.black,
            radius: 10,
            child: Text(playerInfo.isCaptain == '1'
                ? 'c'
                : playerInfo.isViceCaptain == '1'
                ? 'vc'
                : ''),
          )
              : Container(),
        )
      ],
    );
  }
}
