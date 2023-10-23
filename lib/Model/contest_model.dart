class ContestModel{
  String? contestId;
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
  int? remainingTeam;

  ContestModel({
    required this.contestId,
    required this.contestName,
    required this.contestTag,
    required this.winners,
    required this.prizePool,
    required this.totalTeam,
    required this.joinTeam,
    required this.entry,
    required this.contestDescription,
    required this.contestNote1,
    required this.contestNote2,
    required this.winningNote,
    required this.matchId,
    required this.type,
    required this.remainingTeam,
   });

    factory ContestModel.fromJson(Map<String, dynamic> json) {
    return ContestModel(
      contestId: json["contest_id"],
      contestName: json["contest_name"],
      contestTag: json["contest_tag"],
      winners: json["winners"],
      prizePool: json["prize_pool"],
      totalTeam: json["total_team"],
      joinTeam: json["join_team"],
      entry: json["entry"],
      contestDescription: json["contest_description"],
      contestNote1: json["contest_note1"],
      contestNote2: json["contest_note2"],
      winningNote: json["winning_note"],
      matchId: json["match_id"],
      type: json["type"],
      remainingTeam: json["remaining_team"],
    );
  }
}