class UserModel {
  UserModel({
    this.about,
    this.email,
    this.id,
    this.phoneNumber,
    this.userName,
  });

  UserModel.fromJson(dynamic json) {
    about = json['about'];
    email = json['email'];
    id = json['id'];
    phoneNumber = json['phoneNumber'];
    userName = json['userName'];
  }
  String? about;
  String? email;
  String? id;
  String? phoneNumber;
  String? userName;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['about'] = about;
    map['email'] = email;
    map['id'] = id;
    map['phoneNumber'] = phoneNumber;
    map['userName'] = userName;
    return map;
  }

}