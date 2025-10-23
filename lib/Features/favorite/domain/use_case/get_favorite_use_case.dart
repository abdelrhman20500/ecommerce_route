import 'package:dartz/dartz.dart';
import 'package:route_ecommerce/Core/base_use_case/base_use_case.dart';
import 'package:route_ecommerce/Core/utils/errors/failure.dart';
import 'package:route_ecommerce/Features/favorite/data/model/favorite_model.dart';
import 'package:route_ecommerce/Features/favorite/domain/repo/favorite_repo.dart';

class GetFavoriteUseCase extends BaseUseCase<FavoriteModel, NoParameters>{
  final FavoriteRepo favoriteRepo;

  GetFavoriteUseCase({required this.favoriteRepo});
  @override
  Future<Either<Failure, FavoriteModel>> call(NoParameters parameters)async{
    return await favoriteRepo.getFavorite();
  }

}