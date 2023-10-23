import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:dream11_pw/Constant/api_url.dart';
import 'package:http/http.dart'as http;
import '../Model/player_list_model.dart';

class PlayerListProvider with ChangeNotifier {
  List<PlayerListModel> _allPlayers = [];

  List<PlayerListModel> get allPlayers => _allPlayers;

  set allPlayers(List<PlayerListModel> players) {
    _allPlayers = players;
    notifyListeners();
  }

  Future<void> getTeamsPlayersList(String teamId1, String teamId2) async {
    _allPlayers.clear();
    try {
      final response = await http.post(Uri.parse(ApiUrl.playerLists),
          headers: <String, String>{
            'content-Type': 'application/json; charset=UTF-8',
          },
          body: jsonEncode(<String, String>{
            "team1id": teamId1,
            "team2id": teamId2
          }));

      if (response.statusCode == 200) {
        List jsonData = json.decode(response.body)['data'];
        for (var json in jsonData) {
          PlayerListModel player = PlayerListModel.fromJson(json);
          _allPlayers.add(player);
        }
        notifyListeners(); // Notify listeners after updating the list
      } else {
        if (kDebugMode) {
          print('Failed to load data');
        }
      }
    } catch (e) {
      if (kDebugMode) {
        print('Error fetching data: $e');
      }
    }
  }
}
