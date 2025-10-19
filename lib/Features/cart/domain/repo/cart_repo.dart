import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:route_ecommerce/Features/cart/data/model/cart_model.dart';
import '../../../../Core/utils/errors/failure.dart';

abstract class CartRepo{
  Future<Either<Failure, CartModel>> getCartUser();
  Future<Either<Failure, CartModel>> deleteCartUser({required String productId});
  Future<Either<Failure, CartModel>> updateCountCart(UpdateCountCartParameters parameters);

}


class UpdateCountCartParameters extends Equatable {
  final String productId;
  final int count;

  const UpdateCountCartParameters({
    required this.productId,
    required this.count,
  });

  @override
  List<Object?> get props => [productId, count];
}
