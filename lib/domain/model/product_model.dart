
class Product {
  Product({
    this.name,
    this.fillColor,
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
    this.seller,
    this.isFavourite=false});

  Product.fromJson(dynamic json) {
    name = json['name'];
    fillColor = json['fillColor'];
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
  String? fillColor;
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
  bool isFavourite = false;

  Map<String, dynamic> toJson()
  {
    final map = <String, dynamic>{};
    map['name'] = name;
    map['fillColor'] = fillColor;
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
    map['categoryID'] = categoryID;
    return map;
  }

  Map<String, dynamic> toDb() {
    final map = <String, dynamic>{};
    map['productId'] = categoryID;
    map['productName'] = name;
    map['productPrice'] = price.toString();
    map['productAddress'] = address;
    map['productDescription'] = description;
    map['productSize'] = size;
    map['productColor'] = color;
    map['productFillColor'] = fillColor;
    map['productImage'] = image;
    map['productRate'] = rate;
    map['productSearchTimes'] = searchTimes;
    map['productQuantity'] = quantity;
    map['productSellTimes'] = sellTimes.toString();
    map['productSeller'] = seller;
    map['productDiscount'] = discount;
    return map;
  }
  Product.fromDb(dynamic json) {
    categoryID = json['productId'];
    name = json['productName'];
    price = int.tryParse(json['productPrice'])??0;
    address = json['productAddress'];
    description = json['productDescription'];
    size = json['productSize'];
    color = json['productColor'];
    image = json['productImage'];
    rate = json['productRate'];
    searchTimes = json['productSearchTimes'];
    quantity = json['productQuantity'];
    sellTimes = int.tryParse(json['productSellTimes'])??0;
    seller = json['productSeller'];
    discount = json['productDiscount'];
    fillColor = json['productFillColor'];
  }

}