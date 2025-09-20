import 'package:equatable/equatable.dart';

class CategoryEntity extends Equatable {
  final String id;
  final String name;
  final String image;
  final String slug;
  final DateTime createdAt;
  final DateTime updatedAt;

  const CategoryEntity({
    required this.id,
    required this.name,
    required this.image,
    required this.slug,
    required this.createdAt,
    required this.updatedAt
  });

  @override
  List<Object?> get props => [
    id,
    name,
    image,
    slug,
    createdAt,
    updatedAt,
  ];
}
