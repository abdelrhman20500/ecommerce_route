import 'package:dartz/dartz.dart';
import 'package:route_ecommerce/Core/utils/errors/failure.dart';
import 'package:route_ecommerce/Features/category/data/model/add_cart_model.dart';
import 'package:route_ecommerce/Features/category/data/model/product_details_model.dart';
import 'package:route_ecommerce/Features/category/data/model/product_model.dart';

abstract class ProductRepo{
  Future<Either<Failure, List<ProductModel>>> productData();
  Future<Either<Failure, ProductDetailsModel>> productId({required String productId});
  Future<Either<Failure, AddCartModel>> addCart({required String productId});

}