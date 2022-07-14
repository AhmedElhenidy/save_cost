class Post {

  Post({
    this.from,
    this.to,
    this.carModel,
    this.date,
    this.time,
    this.user,
   });

  Post.fromJson(dynamic json) {
    from = json['from'];
    to = json['to'];
    carModel = json['carModel'];
    date = json['date'];
    time = json['time'];
    user = json['user'];

  }

  String? from;
  String? to;
  String? carModel;
  String? date;
  String? time;
  String? user;
  Map<String, dynamic> toJson()
  {
    final map = <String, dynamic>{};
    map['from'] = from;
    map['to'] = to;
    map['carModel'] = carModel;
    map['date'] = date;
    map['time'] = time;
    map['user'] = user;
    return map;
  }


}