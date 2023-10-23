
class PlayerListModel {
  String? id;
  String? pid;
  String? squad;
  String? name;
  String? designationId;
  String? teamId;
  String? playingStatus;
  String? creditPoints;
  String? points;
  String? image;
  String? dob;
  String? nationality;
  String? bowls;
  String? bats;
  String? createdDate;
  String? modifiedDate;
  String? teamName;

  PlayerListModel({
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
     this.teamName,
  });

  factory PlayerListModel.fromJson(Map<String, dynamic> json) {
    return PlayerListModel(
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
      teamName: json['t_name'],
    );
  }
}
