import 'package:dartz/dartz.dart';
import 'package:route_ecommerce/Features/home/domain/entity/category_entity.dart';
import '../../../../Core/utils/errors/failure.dart';

abstract class HomeRepo{
  Future<Either<Failure, List<CategoryEntity>>> categoryData();
}