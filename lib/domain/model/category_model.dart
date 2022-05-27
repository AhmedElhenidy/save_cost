
class CategoryModel {
  CategoryModel({
    this.name,
  this.id,this.imageURl});

  CategoryModel.fromJson(dynamic json) {
    name = json['name'];
    id = json['id'];
    imageURl = json['imageURL'];
  }
  String? name;
  String? id;
  String? imageURl;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['name'] = name;
    map['id'] = id;
    map['imageURL'] = imageURl;
    return map;
  }

}