class WinningContestModel {
  String? winningInfoId;
  String? contestId;
  String? rank;
  String? fromRank;
  String? toRank;
  String? price;

  WinningContestModel({
     this.winningInfoId,
     this.contestId,
     this.rank,
     this.fromRank,
     this.toRank,
     this.price,
  });

  factory WinningContestModel.fromJson(Map<String, dynamic> json) => WinningContestModel(
    winningInfoId: json["winning_info_id"],
    contestId: json["contest_id"],
    rank: json["rank"],
    fromRank: json["from_rank"],
    toRank: json["to_rank"],
    price: json["price"],
  );
}