class UserModel {
  UserModel({
    this.about,
    this.email,
    this.id,
    this.phoneNumber,
    this.userName,
    this.image,
  });

  UserModel.fromJson(dynamic json) {
    about = json['about'];
    email = json['email'];
    id = json['id'];
    phoneNumber = json['phoneNumber'];
    userName = json['userName'];
    image = json['image'];
  }
  String? about;
  String? email;
  String? id;
  String? phoneNumber;
  String? userName;
  String? image;

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