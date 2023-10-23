class refer_earn {
  String? userId;
  String? name;
  String? email;
  String? bonus;
  String? image;

  refer_earn({
    required this.userId,
    required this.name,
    required this.email,
    required this.bonus,
    required this.image,
  });

  factory refer_earn.fromJson(Map<String, dynamic> json) => refer_earn(
    userId: json["user_id"],
    name: json["name"],
    email: json["email"],
    bonus: json["bonus"],
    image: json["image"],
  );
}