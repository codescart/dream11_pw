

class Notification_controller {
  String? id;
  dynamic? matchId;
  String? contestId;
  dynamic? title;
  String? contestName;
  String? contestDescription;


  Notification_controller({
    required this.id,
    required this.matchId,
    required this.contestId,
    required this.title,
    required this.contestName,
    required this.contestDescription,
  });

  factory Notification_controller.fromJson(Map<String, dynamic> json) => Notification_controller(
    id: json["id"],
    matchId: json["match_id"],
    contestId: json["contest_id"],
    title: json["title"],
    contestName: json["contest_name"],
    contestDescription: json["contest_description"],
  );
}