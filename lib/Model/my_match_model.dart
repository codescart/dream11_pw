class MyMatchModel {
  String? myMatchId;
  String? teamId1;
  String? teamId2;
  String? elevenOut;
  String? userId;
  String? myTeamId;
  String? contestId;
  String? type;
  String? matchId;
  int? time;
  String? matchStatus;
  String? matchStarted;
  String? createdDate;
  String? modifiedDate;
  String? creditType;
  String? bonusType;
  String? winningType;
  String? cancelled;
  int? contestCount;
  int? teamCount;
  String? teamName1;
  String? teamImage1;
  String? teamShortName1;
  String? teamName2;
  String? teamImage2;
  String? teamShortName2;
  String? leagueName;
  dynamic team1Score;
  dynamic team1Over;
  dynamic team2Score;
  dynamic team2Over;
  dynamic team1ScoreSecondInning;
  dynamic team1OverSecondInning;
  dynamic team2ScoreSecondInning;
  dynamic team2OverSecondInning;
  String? matchStatusNote;

  MyMatchModel({
     this.myMatchId,
     this.teamId1,
     this.teamId2,
     this.elevenOut,
     this.userId,
     this.myTeamId,
     this.contestId,
     this.type,
     this.matchId,
     this.time,
     this.matchStatus,
     this.matchStarted,
     this.createdDate,
     this.modifiedDate,
     this.creditType,
     this.bonusType,
     this.winningType,
     this.cancelled,
     this.contestCount,
     this.teamCount,
     this.teamName1,
     this.teamImage1,
     this.teamShortName1,
     this.teamName2,
     this.teamImage2,
     this.teamShortName2,
     this.leagueName,
     this.team1Score,
     this.team1Over,
     this.team2Score,
     this.team2Over,
     this.team1ScoreSecondInning,
     this.team1OverSecondInning,
     this.team2ScoreSecondInning,
     this.team2OverSecondInning,
     this.matchStatusNote,
  });

  factory MyMatchModel.fromJson(Map<String, dynamic> json) {
    return MyMatchModel(
      myMatchId: json['my_match_id'],
      teamId1: json['teamid1'],
      teamId2: json['teamid2'],
      elevenOut: json['eleven_out'],
      userId: json['user_id'],
      myTeamId: json['my_team_id'],
      contestId: json['contest_id'],
      type: json['type'],
      matchId: json['match_id'],
      time: json['time'],
      matchStatus: json['match_status'],
      matchStarted: json['matchStarted'],
      createdDate: json['created_date'],
      modifiedDate: json['modified_date'],
      creditType: json['credit_type'],
      bonusType: json['bonus_type'],
      winningType: json['winning_type'],
      cancelled: json['cancelled'],
      contestCount: json['contest_count'],
      teamCount: json['team_count'],
      teamName1: json['team_name1'],
      teamImage1: json['team_image1'],
      teamShortName1: json['team_short_name1'],
      teamName2: json['team_name2'],
      teamImage2: json['team_image2'],
      teamShortName2: json['team_short_name2'],
      leagueName: json['league_name'],
      team1Score: json['team1Score'],
      team1Over: json['team1Over'],
      team2Score: json['team2Score'],
      team2Over: json['team2Over'],
      team1ScoreSecondInning: json['team1Score_secondInning'],
      team1OverSecondInning: json['team1Over_secondInning'],
      team2ScoreSecondInning: json['team2Score_secondInning'],
      team2OverSecondInning: json['team2Over_secondInning'],
      matchStatusNote: json['match_status_note'],
    );
  }
}
