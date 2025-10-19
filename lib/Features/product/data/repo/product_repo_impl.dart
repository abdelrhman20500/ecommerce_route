import 'package:dartz/dartz.dart';
import 'package:route_ecommerce/Core/utils/errors/failure.dart';
import '../../../../Core/utils/errors/exception.dart';
import '../../domain/repo/product_repo.dart';
import '../data_source/product_remote_data_source.dart';
import '../model/add_cart_model.dart';
import '../model/product_details_model.dart';
import '../model/product_model.dart';

class ProductRepoImpl extends ProductRepo{
  final ProductRemoteDataSource productRemoteDataSource;

  ProductRepoImpl({required this.productRemoteDataSource});
  @override
  Future<Either<Failure, List<ProductModel>>> productData() async{
    try {
      var result = await productRemoteDataSource.getProduct();
      return Right(result);
    }on ServerException catch (failure) {
      return Left(ServerFailure(failure.errorMessageModel.message));
    }
  }

  @override
  Future<Either<Failure, ProductDetailsModel>> productId({required String productId})async{
    try {
      var result = await productRemoteDataSource.productId(productId: productId);
      return Right(result);
    }on ServerException catch (failure) {
      return Left(ServerFailure(failure.errorMessageModel.message));
    }
  }

  @override
  Future<Either<Failure, AddCartModel>> addCart({required String productId})async{
    try {
      var result = await productRemoteDataSource.addCart(productId: productId);
      return Right(result);
    }on ServerException catch (failure) {
      return Left(ServerFailure(failure.errorMessageModel.message));
    }
  }

}