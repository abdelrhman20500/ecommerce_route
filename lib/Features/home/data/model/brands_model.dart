import 'package:route_ecommerce/Features/home/domain/entity/brands_entity.dart';

class BrandsModel extends BrandsEntity {
  const BrandsModel({
    required super.id,
    required super.name,
    required super.slug,
    required super.image,
    required super.createdAt,
    required super.updatedAt,
  });

  // Factory constructor to create an instance from JSON
  factory BrandsModel.fromJson(Map<String, dynamic> json) {
    return BrandsModel(
      id: json["_id"],
      name: json["name"],
      slug: json["slug"],
      image: json["image"],
      createdAt: DateTime.parse(json["createdAt"]),
      updatedAt: DateTime.parse(json["updatedAt"]),
    );
  }

  // Method to convert the model back to JSON
  Map<String, dynamic> toJson() {
    return {
      "_id": id,
      "name": name,
      "slug": slug,
      "image": image,
      "createdAt": createdAt.toIso8601String(),
      "updatedAt": updatedAt.toIso8601String(),
    };
  }
}