
class ProductDetailsModel {
  Data? data;

  ProductDetailsModel({this.data});

  ProductDetailsModel.fromJson(Map<String, dynamic> json) {
    if(json["data"] is Map) {
      data = json["data"] == null ? null : Data.fromJson(json["data"]);
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    if(data != null) {
      _data["data"] = data?.toJson();
    }
    return _data;
  }
}

class Data {
  int? sold;
  List<String>? images;
  // List<Subcategory>? subcategory;
  int? ratingsQuantity;
  String? id;
  String? title;
  String? slug;
  String? description;
  int? quantity;
  int? price;
  String? imageCover;
  // Category? category;
  // Brand? brand;
  double? ratingsAverage;
  String? createdAt;
  String? updatedAt;
  int? v;
  List<dynamic>? reviews;
  // String? id;

  Data({this.sold, this.images,this.ratingsQuantity, this.id, this.title, this.slug, this.description, this.quantity, this.price, this.imageCover, this.ratingsAverage, this.createdAt, this.updatedAt, this.v, this.reviews,});

  Data.fromJson(Map<String, dynamic> json) {
    if(json["sold"] is num) {
      sold = (json["sold"] as num).toInt();
    }
    if(json["images"] is List) {
      images = json["images"] == null ? null : List<String>.from(json["images"]);
    }
    // if(json["subcategory"] is List) {
    //   subcategory = json["subcategory"] == null ? null : (json["subcategory"] as List).map((e) => Subcategory.fromJson(e)).toList();
    // }
    if(json["ratingsQuantity"] is num) {
      ratingsQuantity = (json["ratingsQuantity"] as num).toInt();
    }
    if(json["_id"] is String) {
      id = json["_id"];
    }
    if(json["title"] is String) {
      title = json["title"];
    }
    if(json["slug"] is String) {
      slug = json["slug"];
    }
    if(json["description"] is String) {
      description = json["description"];
    }
    if(json["quantity"] is num) {
      quantity = (json["quantity"] as num).toInt();
    }
    if(json["price"] is num) {
      price = (json["price"] as num).toInt();
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
    if(json["createdAt"] is String) {
      createdAt = json["createdAt"];
    }
    if(json["updatedAt"] is String) {
      updatedAt = json["updatedAt"];
    }
    if(json["__v"] is num) {
      v = (json["__v"] as num).toInt();
    }
    if(json["reviews"] is List) {
      reviews = json["reviews"] ?? [];
    }
    // if(json["id"] is String) {
    //   id = json["id"];
    // }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    _data["sold"] = sold;
    if(images != null) {
      _data["images"] = images;
    }
    // if(subcategory != null) {
    //   _data["subcategory"] = subcategory?.map((e) => e.toJson()).toList();
    // }
    _data["ratingsQuantity"] = ratingsQuantity;
    _data["_id"] = id;
    _data["title"] = title;
    _data["slug"] = slug;
    _data["description"] = description;
    _data["quantity"] = quantity;
    _data["price"] = price;
    _data["imageCover"] = imageCover;
    // if(category != null) {
    //   _data["category"] = category?.toJson();
    // }
    // if(brand != null) {
    //   _data["brand"] = brand?.toJson();
    // }
    _data["ratingsAverage"] = ratingsAverage;
    _data["createdAt"] = createdAt;
    _data["updatedAt"] = updatedAt;
    _data["__v"] = v;
    if(reviews != null) {
      _data["reviews"] = reviews;
    }
    // _data["id"] = id;
    return _data;
  }
}

// class Brand {
//   String? id;
//   String? name;
//   String? slug;
//   String? image;
//
//   Brand({this.id, this.name, this.slug, this.image});
//
//   Brand.fromJson(Map<String, dynamic> json) {
//     if(json["_id"] is String) {
//       id = json["_id"];
//     }
//     if(json["name"] is String) {
//       name = json["name"];
//     }
//     if(json["slug"] is String) {
//       slug = json["slug"];
//     }
//     if(json["image"] is String) {
//       image = json["image"];
//     }
//   }
//
//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> _data = <String, dynamic>{};
//     _data["_id"] = id;
//     _data["name"] = name;
//     _data["slug"] = slug;
//     _data["image"] = image;
//     return _data;
//   }
// }
//
// class Category {
//   String? id;
//   String? name;
//   String? slug;
//   String? image;
//
//   Category({this.id, this.name, this.slug, this.image});
//
//   Category.fromJson(Map<String, dynamic> json) {
//     if(json["_id"] is String) {
//       id = json["_id"];
//     }
//     if(json["name"] is String) {
//       name = json["name"];
//     }
//     if(json["slug"] is String) {
//       slug = json["slug"];
//     }
//     if(json["image"] is String) {
//       image = json["image"];
//     }
//   }
//
//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> _data = <String, dynamic>{};
//     _data["_id"] = id;
//     _data["name"] = name;
//     _data["slug"] = slug;
//     _data["image"] = image;
//     return _data;
//   }
// }
//
// class Subcategory {
//   String? id;
//   String? name;
//   String? slug;
//   String? category;
//
//   Subcategory({this.id, this.name, this.slug, this.category});
//
//   Subcategory.fromJson(Map<String, dynamic> json) {
//     if(json["_id"] is String) {
//       id = json["_id"];
//     }
//     if(json["name"] is String) {
//       name = json["name"];
//     }
//     if(json["slug"] is String) {
//       slug = json["slug"];
//     }
//     if(json["category"] is String) {
//       category = json["category"];
//     }
//   }
//
//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> _data = <String, dynamic>{};
//     _data["_id"] = id;
//     _data["name"] = name;
//     _data["slug"] = slug;
//     _data["category"] = category;
//     return _data;
//   }
// }