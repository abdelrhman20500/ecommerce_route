import 'package:dartz/dartz.dart';
import 'package:route_ecommerce/Features/cart/data/model/cart_model.dart';
import '../../../../Core/utils/errors/failure.dart';

abstract class CartRepo{
  Future<Either<Failure, CartModel>> getCartUser();

}