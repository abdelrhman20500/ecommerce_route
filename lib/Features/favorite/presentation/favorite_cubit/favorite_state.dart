import 'package:route_ecommerce/Features/favorite/data/model/add_favorite_model.dart';
import 'package:route_ecommerce/Features/favorite/data/model/favorite_model.dart';
import 'package:route_ecommerce/Features/favorite/data/model/remove_favorite_model.dart';

abstract class FavoriteState{}
class FavoriteInitial extends FavoriteState{}

/// get Favorite States
class FavoriteLoading extends FavoriteState{}
class FavoriteFailure extends FavoriteState{
  final String errMessage;
  FavoriteFailure({required this.errMessage});
}
class FavoriteSuccess extends FavoriteState{
  final FavoriteModel favoriteModel;
  FavoriteSuccess({required this.favoriteModel});
}
class FavoriteStatusUpdated extends FavoriteState{}

/// add Favorite States
class AddFavoriteILoading extends FavoriteState{}
class AddFavoriteFailure extends FavoriteState{
  final String errMessage;
  AddFavoriteFailure({required this.errMessage});
}
class AddFavoriteSuccess extends FavoriteState{
  final AddFavoriteModel addFavoriteModel;
  AddFavoriteSuccess({required this.addFavoriteModel});
}

/// delete Favorite States

class RemoveFavoriteILoading extends FavoriteState{}
class RemoveFavoriteFailure extends FavoriteState{
  final String errMessage;
  RemoveFavoriteFailure({required this.errMessage});
}
class RemoveFavoriteSuccess extends FavoriteState{
  final RemoveFavoriteModel removeFavoriteModel;
  RemoveFavoriteSuccess({required this.removeFavoriteModel});
}