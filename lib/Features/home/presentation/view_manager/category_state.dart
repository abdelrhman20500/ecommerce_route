import 'package:route_ecommerce/Features/home/domain/entity/brands_entity.dart';

import '../../domain/entity/category_entity.dart';

abstract class CategoryState{}
class CategoryInitial extends CategoryState{}
class CategoryLoading extends CategoryState{}
class CategoryFailure extends CategoryState{
  final String errMessage;
  CategoryFailure({required this.errMessage});
}
class CategorySuccess extends CategoryState{
  final List<CategoryEntity> categoryEntity;
  CategorySuccess({required this.categoryEntity});
}
class BrandsLoading extends CategoryState{}
class BrandsFailure extends CategoryState{
  final String errMessage;
  BrandsFailure({required this.errMessage});
}
class BrandsSuccess extends CategoryState{
  final List<BrandsEntity> brandsEntity;
  BrandsSuccess({required this.brandsEntity});
}