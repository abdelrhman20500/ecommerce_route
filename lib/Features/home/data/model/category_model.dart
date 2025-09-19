
class CategoryModel {
  String? id;
  String? name;
  String? slug;
  String? image;
  String? createdAt;
  String? updatedAt;

  CategoryModel({this.id, this.name, this.slug, this.image, this.createdAt, this.updatedAt});

  CategoryModel.fromJson(Map<String, dynamic> json) {
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
    if(json["createdAt"] is String) {
      createdAt = json["createdAt"];
    }
    if(json["updatedAt"] is String) {
      updatedAt = json["updatedAt"];
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data["_id"] = id;
    data["name"] = name;
    data["slug"] = slug;
    data["image"] = image;
    data["createdAt"] = createdAt;
    data["updatedAt"] = updatedAt;
    return data;
  }
}
