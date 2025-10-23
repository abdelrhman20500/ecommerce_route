import 'package:dartz/dartz.dart';
import 'package:route_ecommerce/Core/base_use_case/base_use_case.dart';
import 'package:route_ecommerce/Core/utils/errors/failure.dart';
import 'package:route_ecommerce/Features/favorite/data/model/add_favorite_model.dart';
import 'package:route_ecommerce/Features/favorite/domain/repo/favorite_repo.dart';

class AddFavoriteUseCase extends BaseUseCase<AddFavoriteModel, String>{
  final FavoriteRepo favoriteRepo;

  AddFavoriteUseCase({required this.favoriteRepo});
  @override
  Future<Either<Failure, AddFavoriteModel>> call([String? productId])async{
   return await favoriteRepo.addFavorite(productId: productId!);
  }

}