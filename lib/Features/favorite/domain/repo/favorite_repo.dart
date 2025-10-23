import 'package:dartz/dartz.dart';
import 'package:route_ecommerce/Core/utils/errors/failure.dart';
import 'package:route_ecommerce/Features/favorite/data/model/add_favorite_model.dart';
import 'package:route_ecommerce/Features/favorite/data/model/favorite_model.dart';
import '../../data/model/remove_favorite_model.dart';

abstract class FavoriteRepo{
  Future<Either<Failure, FavoriteModel>> getFavorite();
  Future<Either<Failure, AddFavoriteModel>> addFavorite({required String productId});
  Future<Either<Failure, RemoveFavoriteModel>> removeFavorite({required String productId});

}