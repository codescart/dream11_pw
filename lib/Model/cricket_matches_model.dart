class CricketMatchesModel{
  String? matchId;
  String? uniqueId;
  String? competitionId;
  String? squad;
  dynamic tossWinnerTeam;
  String? winnerTeam;
  String? teamId1;
  String? teamId2;
  String? elevenOut;
  String? matchStatus;
  String? matchStarted;
  String? type;
  int? time;
  DateTime? matchDateTime;
  String? title;
  String? leagueName;
  String? refund;
  String? team1Score;
  String? team1Over;
  String? team2Score;
  String? team2Over;
  String? team1ScoreSecondInning;
  String? team1OverSecondInning;
  String? team2ScoreSecondInning;
  String? team2OverSecondInning;
  String? paymentStatus;
  String? matchStatusNote;
  DateTime? createdDate;
  DateTime? modifiedDate;
  String? cancelled;
  String? teamName1;
  String? teamImage1;
  String? teamShortName1;
  String? teamName2;
  String? teamImage2;
  String? teamShortName2;

  CricketMatchesModel({
     this.matchId,
     this.uniqueId,
     this.competitionId,
     this.squad,
     this.tossWinnerTeam,
     this.winnerTeam,
     this.teamId1,
     this.teamId2,
     this.elevenOut,
     this.matchStatus,
     this.matchStarted,
     this.type,
     this.time,
     this.matchDateTime,
     this.title,
     this.leagueName,
     this.refund,
     this.team1Score,
     this.team1Over,
     this.team2Score,
     this.team2Over,
     this.team1ScoreSecondInning,
     this.team1OverSecondInning,
     this.team2ScoreSecondInning,
     this.team2OverSecondInning,
     this.paymentStatus,
     this.matchStatusNote,
     this.createdDate,
     this.modifiedDate,
     this.cancelled,
     this.teamName1,
     this.teamImage1,
     this.teamShortName1,
     this.teamName2,
     this.teamImage2,
     this.teamShortName2,
  });

  factory CricketMatchesModel.fromJson(Map<String, dynamic> json) {
    return CricketMatchesModel(
      matchId: json["match_id"],
      uniqueId: json["unique_id"],
      competitionId: json["competition_id"],
      squad: json["squad"],
      tossWinnerTeam: json["toss_winner_team"],
      winnerTeam: json["winner_team"],
      teamId1: json["teamid1"],
      teamId2: json["teamid2"],
      elevenOut: json["eleven_out"],
      matchStatus: json["match_status"],
      matchStarted: json["matchStarted"],
      type: json["type"],
      time: json["time"],
      matchDateTime: DateTime.parse(json["match_date_time"]),
      title: json["title"],
      leagueName: json["league_name"],
      refund: json["refund"],
      team1Score: json["team1Score"],
      team1Over: json["team1Over"],
      team2Score: json["team2Score"],
      team2Over: json["team2Over"],
      team1ScoreSecondInning: json["team1Score_secondInning"],
      team1OverSecondInning: json["team1Over_secondInning"],
      team2ScoreSecondInning: json["team2Score_secondInning"],
      team2OverSecondInning: json["team2Over_secondInning"],
      paymentStatus: json["payment_status"],
      matchStatusNote: json["match_status_note"],
      createdDate: DateTime.parse(json["created_date"]),
      modifiedDate: DateTime.parse(json["modified_date"]),
      cancelled: json["cancelled"],
      teamName1: json["team_name1"],
      teamImage1: json["team_image1"],
      teamShortName1: json["team_short_name1"],
      teamName2: json["team_name2"],
      teamImage2: json["team_image2"],
      teamShortName2: json["team_short_name2"],
    );
  }
}