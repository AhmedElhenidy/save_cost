class Post {

  Post({
    this.from,
    this.to,
    this.carModel,
    this.date,
    this.time,
    this.user,
    this.image,
    this.plateNumbers,
    this.userName='sara mohamed',
    this.emailAddress='sara124@gmail.com',
   });

  Post.fromJson(dynamic json) {
    from = json['from'];
    to = json['to'];
    carModel = json['carModel'];
    date = json['date'];
    time = json['time'];
    user = json['user'];
    image = json['image'];
    plateNumbers = json['plateNumbers'];
    userName = json['userName'];
    emailAddress = json['emailAddress'];

  }

  String? from;
  String? to;
  String? carModel;
  String? date;
  String? time;
  String? user;
  String? image;
  String? plateNumbers;
  String userName='sara mohamed';
  String emailAddress='sara124@gmail.com';
  Map<String, dynamic> toJson()
  {
    final map = <String, dynamic>{};
    map['from'] = from;
    map['to'] = to;
    map['carModel'] = carModel;
    map['date'] = date;
    map['time'] = time;
    map['user'] = user;
    map['plateNumbers'] = plateNumbers;
    map['userName'] = userName;
    map['emailAddress'] = emailAddress;
    return map;
  }


}