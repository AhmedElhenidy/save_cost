
class Product {
  Product({
    this.name,
    this.price,
    this.address,
    this.description,
    this.size,
    this.color,
    this.image,
    this.rate,
    this.searchTimes,
    this.quantity,
    this.sellTimes,
    this.seller,});

  Product.fromJson(dynamic json) {
    name = json['name'];
    price = json['price'];
    address = json['address'];
    description = json['description'];
    size = json['size'];
    color = json['color'];
    image = json['image'];
    rate = json['rate'];
    searchTimes = json['search_times'];
    quantity = json['quantity'];
    sellTimes = int.parse(json['sell_times']);
    seller = json['seller'];
    categoryID = json['categoryID'];
    discount = json['discount'];
  }
  String? name;
  String? categoryID;
  String? discount;
  int? price;
  String? address;
  String? description;
  String? size;
  String? color;
  String? image;
  String? rate;
  String? searchTimes;
  String? quantity;
  int? sellTimes;
  String? seller;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['name'] = name;
    map['price'] = price;
    map['address'] = address;
    map['description'] = description;
    map['size'] = size;
    map['color'] = color;
    map['image'] = image;
    map['rate'] = rate;
    map['search_times'] = searchTimes;
    map['quantity'] = quantity;
    map['sell_times'] = sellTimes;
    map['seller'] = seller;
    return map;
  }

}