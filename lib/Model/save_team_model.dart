
class SaveTeamModel {
  final String? id;
  final String? matchId;
  final String? userId;
  final String? teamNumber;
  final String? captain;
  final String? captainImage;
  final String? viceCaptain;
  final String? viceCaptainImage;
  final int? batsman;
  final int? bowler;
  final int? allRounder;
  final int? wicketKeeper;
  final List<PlayerInfo>? playerInfo;
  final List<Team>? team1;
  final List<Team>? team2;

  SaveTeamModel( {
     this.id,
     this.matchId,
     this.userId,
     this.teamNumber,
     this.captain,
    this.captainImage,
     this.viceCaptain,
    this.viceCaptainImage,
    this.batsman,
     this.bowler,
     this.allRounder,
     this.wicketKeeper,
     this.playerInfo,
     this.team1,
     this.team2,
  });

  factory SaveTeamModel.fromJson(Map<String, dynamic> json) {
    List<PlayerInfo> playerInfoList = (json['playerinfo'] as List)
        .map((playerJson) => PlayerInfo.fromJson(playerJson))
        .toList();

    List<Team> team1List = (json['team1'] as List)
        .map((teamJson) => Team.fromJson(teamJson))
        .toList();

    List<Team> team2List = (json['team2'] as List)
        .map((teamJson) => Team.fromJson(teamJson))
        .toList();

    return SaveTeamModel(
      id: json['id'],
      matchId: json['match_id'],
      userId: json['user_id'],
      teamNumber: json['team_number'],
      captain: json['captain'],
      captainImage: json['captainimage'],
      viceCaptain: json['vicecaptain'],
      viceCaptainImage: json['vicecaptainimage'],
      batsman: json['batsman'],
      bowler: json['boller'],
      allRounder: json['allrounder'],
      wicketKeeper: json['wkeeper'],
      playerInfo: playerInfoList,
      team1: team1List,
      team2: team2List,
    );
  }
}

class PlayerInfo {
  final String? id;
  final String? pid;
  final String? squad;
  final String? name;
  final String? designationId;
  final String? teamId;
  final String? playingStatus;
  final String? creditPoints;
  final String? points;
  final String? image;
  final DateTime? dob;
  final String? nationality;
  final String? bowls;
  final String? bats;
  final String? createdDate;
  final String? modifiedDate;
  final String? playerId;
  final String? isCaptain;
  final String? isViceCaptain;
  final String? teamShortName;

  PlayerInfo({
     this.id,
     this.pid,
     this.squad,
     this.name,
     this.designationId,
     this.teamId,
     this.playingStatus,
     this.creditPoints,
     this.points,
     this.image,
     this.dob,
     this.nationality,
     this.bowls,
     this.bats,
     this.createdDate,
     this.modifiedDate,
     this.playerId,
     this.isCaptain,
     this.isViceCaptain,
     this.teamShortName,
  });

  factory PlayerInfo.fromJson(Map<String, dynamic> json) {
    return PlayerInfo(
      id: json['id'],
      pid: json['pid'],
      squad: json['squad'],
      name: json['name'],
      designationId: json['designationid'],
      teamId: json['teamid'],
      playingStatus: json['playing_status'],
      creditPoints: json['credit_points'],
      points: json['points'],
      image: json['image'],
      dob: DateTime.parse(json['dob']),
      nationality: json['nationality'],
      bowls: json['bowls'],
      bats: json['bats'],
      createdDate: json['created_date'],
      modifiedDate: json['modified_date'],
      playerId: json['player_id'],
      isCaptain: json['is_captain'],
      isViceCaptain: json['is_vicecaptain'],
      teamShortName: json['team_short_name'],
    );
  }
}

class Team {
  final String? teamShortName;
  final String? teamCount;

  Team({
     this.teamShortName,
     this.teamCount,
  });

  factory Team.fromJson(Map<String, dynamic> json) {
    return Team(
      teamShortName: json['team_short_name'],
      teamCount: json['teamcount'],
    );
  }
}
