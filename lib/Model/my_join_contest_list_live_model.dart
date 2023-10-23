class MyJoinContestListLiveModel {
  String? matchStatus;
  String? time;
  String? contestId;
  String? myTeamId;
  String? contestName;
  String? contestTag;
  String? winners;
  String? prizePool;
  String? totalTeam;
  String? joinTeam;
  String? entry;
  String? contestDescription;
  String? contestNote1;
  String? contestNote2;
  String? winningNote;
  String? matchId;
  String? type;
  String? winningAmount;
  String? rank;
  String? teamName;
  int? remainingTeam;
  double? points;

  MyJoinContestListLiveModel({
     this.matchStatus,
     this.time,
     this.contestId,
     this.myTeamId,
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
     this.winningAmount,
     this.rank,
     this.teamName,
     this.remainingTeam,
     this.points,
  });

  factory MyJoinContestListLiveModel.fromJson(Map<String, dynamic> json) {
    return MyJoinContestListLiveModel(
      matchStatus: json['match_status'],
      time: json['time'],
      contestId: json['contest_id'],
      myTeamId: json['my_team_id'],
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
      winningAmount: json['winning_amount'],
      rank: json['rank'],
      teamName: json['team_name'],
      remainingTeam: json['remaining_team'],
      points: json['points'].toDouble(),
    );
  }
}
