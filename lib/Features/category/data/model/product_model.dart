
class ProductModel {
  int? sold;
  List<String>? images;
  List<Subcategory>? subcategory;
  int? ratingsQuantity;
  String? id;
  String? title;
  String? slug;
  String? description;
  int? quantity;
  int? price;
  String? imageCover;
  Category? category;
  Brand? brand;
  double? ratingsAverage;
  String? createdAt;
  String? updatedAt;

  ProductModel({this.sold, this.images, this.subcategory, this.ratingsQuantity, this.id, this.title, this.slug, this.description, this.quantity, this.price, this.imageCover, this.category, this.brand, this.ratingsAverage, this.createdAt, this.updatedAt,});

  ProductModel.fromJson(Map<String, dynamic> json) {
    if(json["sold"] is num) {
      sold = (json["sold"] as num).toInt();
    }
    if(json["images"] is List) {
      images = json["images"] == null ? null : List<String>.from(json["images"]);
    }
    if(json["subcategory"] is List) {
      subcategory = json["subcategory"] == null ? null : (json["subcategory"] as List).map((e) => Subcategory.fromJson(e)).toList();
    }
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
    if(json["category"] is Map) {
      category = json["category"] == null ? null : Category.fromJson(json["category"]);
    }
    if(json["brand"] is Map) {
      brand = json["brand"] == null ? null : Brand.fromJson(json["brand"]);
    }
    if(json["ratingsAverage"] is num) {
      ratingsAverage = (json["ratingsAverage"] as num).toDouble();
    }
    if(json["createdAt"] is String) {
      createdAt = json["createdAt"];
    }
    if(json["updatedAt"] is String) {
      updatedAt = json["updatedAt"];
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data["sold"] = sold;
    if(images != null) {
      data["images"] = images;
    }
    if(subcategory != null) {
      data["subcategory"] = subcategory?.map((e) => e.toJson()).toList();
    }
    data["ratingsQuantity"] = ratingsQuantity;
    data["_id"] = id;
    data["title"] = title;
    data["slug"] = slug;
    data["description"] = description;
    data["quantity"] = quantity;
    data["price"] = price;
    data["imageCover"] = imageCover;
    if(category != null) {
      data["category"] = category?.toJson();
    }
    if(brand != null) {
      data["brand"] = brand?.toJson();
    }
    data["ratingsAverage"] = ratingsAverage;
    data["createdAt"] = createdAt;
    data["updatedAt"] = updatedAt;
    return data;
  }
}

class Brand {
  String? id;
  String? name;
  String? slug;
  String? image;

  Brand({this.id, this.name, this.slug, this.image});

  Brand.fromJson(Map<String, dynamic> json) {
    if(json["_id"] is String) {
      id = json["_id"];
    }
    if(json["name"] is String) {
      name = json["name"];
    }
    if(json["slug"] is String) {
      slug = json["slug"];
    }
    if(json["image"] is String) {
      image = json["image"];
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data["_id"] = id;
    data["name"] = name;
    data["slug"] = slug;
    data["image"] = image;
    return data;
  }
}

class Category {
  String? id;
  String? name;
  String? slug;
  String? image;

  Category({this.id, this.name, this.slug, this.image});

  Category.fromJson(Map<String, dynamic> json) {
    if(json["_id"] is String) {
      id = json["_id"];
    }
    if(json["name"] is String) {
      name = json["name"];
    }
    if(json["slug"] is String) {
      slug = json["slug"];
    }
    if(json["image"] is String) {
      image = json["image"];
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data["_id"] = id;
    data["name"] = name;
    data["slug"] = slug;
    data["image"] = image;
    return data;
  }
}

class Subcategory {
  String? id;
  String? name;
  String? slug;
  String? category;

  Subcategory({this.id, this.name, this.slug, this.category});

  Subcategory.fromJson(Map<String, dynamic> json) {
    if(json["_id"] is String) {
      id = json["_id"];
    }
    if(json["name"] is String) {
      name = json["name"];
    }
    if(json["slug"] is String) {
      slug = json["slug"];
    }
    if(json["category"] is String) {
      category = json["category"];
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data["_id"] = id;
    data["name"] = name;
    data["slug"] = slug;
    data["category"] = category;
    return data;
  }
}