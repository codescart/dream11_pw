import 'package:flutter/material.dart';
import 'package:dream11_pw/Model/my_match_model.dart';
import 'package:dream11_pw/Model/player_list_model.dart';
import 'package:dream11_pw/generated/assets.dart';

class UpCoStaticPreview extends StatelessWidget {
  final List<PlayerListModel> selectedPlayers;
  final MyMatchModel myMatchModel;

  const UpCoStaticPreview(
      {super.key, required this.selectedPlayers, required this.myMatchModel});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.green[700],
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(Icons.arrow_back),
        ),
        title: const Text(
          'Team Preview',
        ),
        centerTitle: true,
      ),
      body: Container(
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
                  for (int i = 0; i < selectedPlayers.length; i++)
                    if (selectedPlayers[i].designationId == '4')
                      PlayerImage(
                        playerImg: '${selectedPlayers[i].image}',
                        name: '${selectedPlayers[i].name}',
                        playerType: 'wk',
                      ),
                ],
              ),
              const SizedBox(height: 8),
              const Text(
                'Batsmen',
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  for (int i = 0; i < selectedPlayers.length; i++)
                    if (selectedPlayers[i].designationId == '1')
                      PlayerImage(
                        playerImg: '${selectedPlayers[i].image}',
                        name: '${selectedPlayers[i].name}',
                        playerType: 'bat',
                      ),
                ],
              ),
              const SizedBox(height: 8),
              const Text(
                'All-rounders',
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  for (int i = 0; i < selectedPlayers.length; i++)
                    if (selectedPlayers[i].designationId == '3')
                      PlayerImage(
                        playerImg: '${selectedPlayers[i].image}',
                        name: '${selectedPlayers[i].name}',
                        playerType: 'Al',
                      ),
                ],
              ),
              const SizedBox(height: 8),
              const Text(
                'Bowlers',
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  for (int i = 0; i < selectedPlayers.length; i++)
                    if (selectedPlayers[i].designationId == '2')
                      PlayerImage(
                        playerImg: '${selectedPlayers[i].image}',
                        name: '${selectedPlayers[i].name}',
                        playerType: 'Bowl',
                      ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class PlayerImage extends StatelessWidget {
  const PlayerImage({
    Key? key,
    required this.playerImg,
    required this.name,
    required this.playerType,
  }) : super(key: key);

  final String playerImg;
  final String name;
  final String playerType;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.all(5),
          child: CircleAvatar(
            backgroundImage: NetworkImage(playerImg),
            backgroundColor: Colors.white,
            radius: 20,
          ),
        ),
        Container(
          padding: const EdgeInsets.all(3),
          decoration: BoxDecoration(
            color: Colors.black,
            borderRadius: BorderRadius.circular(5),
          ),
          child: Text(
            name,
            style: const TextStyle(
              fontSize: 6,
              color: Colors.white,
            ),
          ),
        ),
      ],
    );
  }
}
