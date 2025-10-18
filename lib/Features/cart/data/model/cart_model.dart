
class CartModel {
  String? status;
  int? numOfCartItems;
  String? cartId;
  GetDataCart? data;

  CartModel({this.status, this.numOfCartItems, this.cartId, this.data});

  CartModel.fromJson(Map<String, dynamic> json) {
    if(json["status"] is String) {
      status = json["status"];
    }
    if(json["numOfCartItems"] is num) {
      numOfCartItems = (json["numOfCartItems"] as num).toInt();
    }
    if(json["cartId"] is String) {
      cartId = json["cartId"];
    }
    if(json["data"] is Map) {
      data = json["data"] == null ? null : GetDataCart.fromJson(json["data"]);
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    _data["status"] = status;
    _data["numOfCartItems"] = numOfCartItems;
    _data["cartId"] = cartId;
    if(data != null) {
      _data["data"] = data?.toJson();
    }
    return _data;
  }
}

class GetDataCart {
  String? id;
  String? cartOwner;
  List<GetProductsCart>? products;
  String? createdAt;
  String? updatedAt;
  int? v;
  int? totalCartPrice;

  GetDataCart({this.id, this.cartOwner, this.products, this.createdAt, this.updatedAt, this.v, this.totalCartPrice});

  GetDataCart.fromJson(Map<String, dynamic> json) {
    if(json["_id"] is String) {
      id = json["_id"];
    }
    if(json["cartOwner"] is String) {
      cartOwner = json["cartOwner"];
    }
    if(json["products"] is List) {
      products = json["products"] == null ? null : (json["products"] as List).map((e) => GetProductsCart.fromJson(e)).toList();
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

class GetProductsCart {
  int? count;
  String? id;
  GetProduct? product;
  int? price;

  GetProductsCart({this.count, this.id, this.product, this.price});

  GetProductsCart.fromJson(Map<String, dynamic> json) {
    if(json["count"] is num) {
      count = (json["count"] as num).toInt();
    }
    if(json["_id"] is String) {
      id = json["_id"];
    }
    if(json["product"] is Map) {
      product = json["product"] == null ? null : GetProduct.fromJson(json["product"]);
    }
    if(json["price"] is num) {
      price = (json["price"] as num).toInt();
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data["count"] = count;
    data["_id"] = id;
    if(product != null) {
      data["product"] = product?.toJson();
    }
    data["price"] = price;
    return data;
  }
}

class GetProduct {
  String? id;
  String? title;
  int? quantity;
  String? imageCover;
  double? ratingsAverage;
  String? id2;

  GetProduct({this.id, this.title, this.quantity,
    this.imageCover, this.ratingsAverage, this.id2});

  GetProduct.fromJson(Map<String, dynamic> json) {
    if(json["_id"] is String) {
      id = json["_id"];
    }
    if(json["title"] is String) {
      title = json["title"];
    }
    if(json["quantity"] is num) {
      quantity = (json["quantity"] as num).toInt();
    }
    if(json["imageCover"] is String) {
      imageCover = json["imageCover"];
    }
    // if(json["category"] is Map) {
    //   category = json["category"] == null ? null : Category.fromJson(json["category"]);
    // }
    // if(json["brand"] is Map) {
    //   brand = json["brand"] == null ? null : Brand.fromJson(json["brand"]);
    // }
    if(json["ratingsAverage"] is num) {
      ratingsAverage = (json["ratingsAverage"] as num).toDouble();
    }
    if(json["id"] is String) {
      id2 = json["id"];
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data["_id"] = id;
    data["title"] = title;
    data["quantity"] = quantity;
    data["imageCover"] = imageCover;
    data["ratingsAverage"] = ratingsAverage;
    data["id"] = id2;
    return data;
  }
}

