import 'package:dartz/dartz.dart';
import 'package:route_ecommerce/Core/utils/errors/failure.dart';
import 'package:route_ecommerce/Features/favorite/data/data_source/favorite_remote_data_source.dart';
import 'package:route_ecommerce/Features/favorite/data/model/add_favorite_model.dart';
import 'package:route_ecommerce/Features/favorite/data/model/favorite_model.dart';
import 'package:route_ecommerce/Features/favorite/data/model/remove_favorite_model.dart';
import 'package:route_ecommerce/Features/favorite/domain/repo/favorite_repo.dart';

import '../../../../Core/utils/errors/exception.dart';

class FavoriteRepoImpl extends FavoriteRepo {
  final FavoriteRemoteDataSource favoriteRemoteDataSource;

  FavoriteRepoImpl({required this.favoriteRemoteDataSource});
  @override
  Future<Either<Failure, AddFavoriteModel>> addFavorite({required String productId}) async {
    try {
      var result =
          await favoriteRemoteDataSource.addFavorite(productId: productId);
      return right(result);
    } on ServerException catch (failure) {
      return Left(ServerFailure(failure.errorMessageModel.message));
    }
  }

  @override
  Future<Either<Failure, RemoveFavoriteModel>> removeFavorite({required String productId})async{
    try {
      var result =
      await favoriteRemoteDataSource.removeFavorite(productId: productId);
      return right(result);
    } on ServerException catch (failure) {
      return Left(ServerFailure(failure.errorMessageModel.message));
    }
  }

  @override
  Future<Either<Failure, FavoriteModel>> getFavorite()async{
    try {
      var result =
          await favoriteRemoteDataSource.getFavorite();
      return right(result);
    } on ServerException catch (failure) {
      return Left(ServerFailure(failure.errorMessageModel.message));
    }
  }
}
