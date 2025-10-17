
class AddCartModel {
  String? status;
  String? message;
  int? numOfCartItems;
  String? cartId;
  Data? data;

  AddCartModel({this.status, this.message, this.numOfCartItems, this.cartId, this.data});

  AddCartModel.fromJson(Map<String, dynamic> json) {
    if(json["status"] is String) {
      status = json["status"];
    }
    if(json["message"] is String) {
      message = json["message"];
    }
    if(json["numOfCartItems"] is num) {
      numOfCartItems = (json["numOfCartItems"] as num).toInt();
    }
    if(json["cartId"] is String) {
      cartId = json["cartId"];
    }
    if(json["data"] is Map) {
      data = json["data"] == null ? null : Data.fromJson(json["data"]);
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    _data["status"] = status;
    _data["message"] = message;
    _data["numOfCartItems"] = numOfCartItems;
    _data["cartId"] = cartId;
    if(data != null) {
      _data["data"] = data?.toJson();
    }
    return _data;
  }
}

class Data {
  String? id;
  String? cartOwner;
  List<Products>? products;
  String? createdAt;
  String? updatedAt;
  int? v;
  int? totalCartPrice;

  Data({this.id, this.cartOwner, this.products, this.createdAt, this.updatedAt, this.v, this.totalCartPrice});

  Data.fromJson(Map<String, dynamic> json) {
    if(json["_id"] is String) {
      id = json["_id"];
    }
    if(json["cartOwner"] is String) {
      cartOwner = json["cartOwner"];
    }
    if(json["products"] is List) {
      products = json["products"] == null ? null : (json["products"] as List).map((e) => Products.fromJson(e)).toList();
    }
    if(json["createdAt"] is String) {
      createdAt = json["createdAt"];
    }
    if(json["updatedAt"] is String) {
      updatedAt = json["updatedAt"];
    }
    if(json["__v"] is num) {
      v = (json["__v"] as num).toInt();
    }
    if(json["totalCartPrice"] is num) {
      totalCartPrice = (json["totalCartPrice"] as num).toInt();
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data["_id"] = id;
    data["cartOwner"] = cartOwner;
    if(products != null) {
      data["products"] = products?.map((e) => e.toJson()).toList();
    }
    data["createdAt"] = createdAt;
    data["updatedAt"] = updatedAt;
    data["__v"] = v;
    data["totalCartPrice"] = totalCartPrice;
    return data;
  }
}

class Products {
  int? count;
  String? id;
  String? product;
  int? price;

  Products({this.count, this.id, this.product, this.price});

  Products.fromJson(Map<String, dynamic> json) {
    if(json["count"] is num) {
      count = (json["count"] as num).toInt();
    }
    if(json["_id"] is String) {
      id = json["_id"];
    }
    if(json["product"] is String) {
      product = json["product"];
    }
    if(json["price"] is num) {
      price = (json["price"] as num).toInt();
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data["count"] = count;
    data["_id"] = id;
    data["product"] = product;
    data["price"] = price;
    return data;
  }
}