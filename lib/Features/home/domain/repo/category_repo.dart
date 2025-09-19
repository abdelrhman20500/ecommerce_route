import 'package:dartz/dartz.dart';
import 'package:route_ecommerce/Features/home/data/model/category_model.dart';
import '../../../../Core/utils/errors/failure.dart';

abstract class HomeRepo{
  Future<Either<Failure, List<CategoryModel>>> categoryData();
}