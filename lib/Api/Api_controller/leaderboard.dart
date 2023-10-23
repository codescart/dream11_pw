class leaderbord {
  String id;
  String image;
  String teamid;
  String rank;
  String name;

  leaderbord({
    required this.id,
    required this.image,
    required this.teamid,
    required this.rank,
    required this.name,
  });

  factory leaderbord.fromJson(Map<String, dynamic> json) => leaderbord(
    id: json["id"],
    image: json["image"],
    teamid: json["teamid"],
    rank: json["rank"],
    name: json["name"],
  );
}