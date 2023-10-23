
class JoinContestModel {
  final String? contestId;
  final String? contestName;
  final String? contestTag;
  final String? winners;
  final String? prizePool;
  final String? totalTeam;
  final String? joinTeam;
  final String? entry;
  final String? contestDescription;
  final String? contestNote1;
  final String? contestNote2;
  final String? winningNote;
  final String? matchId;
  final String? type;
  final String? myTeamId;
  final int? remainingTeam;
  final int? teamCount;
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
  final List<TeamInfo>? team1;
  final List<TeamInfo>? team2;

  JoinContestModel({
     this.contestId,
     this.contestName,
     this.contestTag,
     this.winners,
     this.prizePool,
     this.totalTeam,
     this.joinTeam,
     this.entry,
     this.contestDescription,
     this.contestNote1,
     this.contestNote2,
     this.winningNote,
     this.matchId,
     this.type,
     this.myTeamId,
     this.remainingTeam,
     this.teamCount,
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

  factory JoinContestModel.fromJson(Map<String, dynamic> json) {
    return JoinContestModel(
      contestId: json['contest_id'],
      contestName: json['contest_name'],
      contestTag: json['contest_tag'],
      winners: json['winners'],
      prizePool: json['prize_pool'],
      totalTeam: json['total_team'],
      joinTeam: json['join_team'],
      entry: json['entry'],
      contestDescription: json['contest_description'],
      contestNote1: json['contest_note1'],
      contestNote2: json['contest_note2'],
      winningNote: json['winning_note'],
      matchId: json['match_id'],
      type: json['type'],
      myTeamId: json['my_team_id'],
      remainingTeam: json['remaining_team'],
      teamCount: json['team_count'],
      teamNumber: json['team_number'],
      captain: json['captain'],
      captainImage: json['captainimage'],
      viceCaptain: json['vicecaptain'],
      viceCaptainImage: json['vicecaptainimage'],
      batsman: json['batsman'],
      bowler: json['boller'],
      allRounder: json['allrounder'],
      wicketKeeper: json['wkeeper'],
      playerInfo: (json['playerinfo']==null?[]:json['playerinfo'] as List)//as List
          .map((player) => PlayerInfo.fromJson(player))
          .toList(),
      team1: (json['team1'] as List)
          .map((team) => TeamInfo.fromJson(team))
          .toList(),
      team2: (json['team2'] as List)
          .map((team) => TeamInfo.fromJson(team))
          .toList(),
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
  final String? dob;
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
      dob: json['dob'],
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

class TeamInfo {
  final String? teamShortName;
  final String? teamCount;

  TeamInfo({
     this.teamShortName,
     this.teamCount,
  });

  factory TeamInfo.fromJson(Map<String, dynamic> json) {
    return TeamInfo(
      teamShortName: json['team_short_name'],
      teamCount: json['teamcount'],
    );
  }
}

