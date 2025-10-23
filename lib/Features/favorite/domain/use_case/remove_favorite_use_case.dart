import 'package:dartz/dartz.dart';
import 'package:route_ecommerce/Core/base_use_case/base_use_case.dart';
import 'package:route_ecommerce/Core/utils/errors/failure.dart';
import 'package:route_ecommerce/Features/favorite/data/model/remove_favorite_model.dart';
import 'package:route_ecommerce/Features/favorite/domain/repo/favorite_repo.dart';

class RemoveFavoriteUseCase extends BaseUseCase<RemoveFavoriteModel, String>{
  final FavoriteRepo favoriteRepo;

  RemoveFavoriteUseCase({required this.favoriteRepo});
  @override
  Future<Either<Failure, RemoveFavoriteModel>> call([String? productId])async{
    return await favoriteRepo.removeFavorite(productId: productId!);
  }

}