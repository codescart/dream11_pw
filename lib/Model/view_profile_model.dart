class ViewProfileModel {
  String? userId;
  String? name;
  String? mobile;
  String? email;
  String? image;
  String? teamName;
  String? favouriteTeam;
  String? dob;
  String? gender;
  String? address;
  String? city;
  String? pinCode;
  String? state;
  String? country;
  String? referralCode;
  String? code;

  ViewProfileModel(
      {this.userId,
      this.name,
      this.mobile,
      this.email,
      this.image,
      this.teamName,
      this.favouriteTeam,
      this.dob,
      this.gender,
      this.address,
      this.city,
      this.pinCode,
      this.state,
      this.country,
      this.referralCode,
      this.code});

  factory ViewProfileModel.fromJson(Map<String, dynamic> json) {
    return ViewProfileModel(
      userId: json['user_id'],
      name: json['name'],
      mobile: json['mobile'],
      email: json['email'],
      image: json['image'],
      teamName: json['teamName'],
      favouriteTeam: json['favriteTeam'],
      dob: json['dob'],
      gender: json['gender'],
      address: json['address'],
      city: json['city'],
      pinCode: json['pincode'],
      state: json['state'],
      country: json['country'],
      referralCode: json['referral_code'],
      code: json['code'],
    );
  }
}
