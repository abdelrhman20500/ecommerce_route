import 'package:dartz/dartz.dart';
import 'package:route_ecommerce/Core/utils/errors/failure.dart';
import 'package:route_ecommerce/Features/cart/data/data_source/cart_remote_data_source.dart';
import 'package:route_ecommerce/Features/cart/data/model/cart_model.dart';
import 'package:route_ecommerce/Features/cart/domain/repo/cart_repo.dart';
import '../../../../Core/utils/errors/exception.dart';

class CartRepoImpl extends CartRepo {
  final CartRemoteDataSource cartRemoteDataSource;

  CartRepoImpl({required this.cartRemoteDataSource});
  @override
  Future<Either<Failure, CartModel>> getCartUser() async {
    try {
      var result = await cartRemoteDataSource.getCart();
      return Right(result);
    } on ServerException catch (failure) {
      return Left(ServerFailure(failure.errorMessageModel.message));
    }
  }

  @override
  Future<Either<Failure, CartModel>> deleteCartUser({required String productId})async{
    try {
      var result = await cartRemoteDataSource.deleteCart(productId: productId);
      return Right(result);
    } on ServerException catch (failure) {
      return Left(ServerFailure(failure.errorMessageModel.message));
    }
  }
}
