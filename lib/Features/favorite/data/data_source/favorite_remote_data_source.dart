import 'package:route_ecommerce/Core/function/api_service.dart';
import 'package:route_ecommerce/Core/utils/shared_preferences.dart';
import 'package:route_ecommerce/Features/favorite/data/model/add_favorite_model.dart';
import 'package:route_ecommerce/Features/favorite/data/model/favorite_model.dart';
import 'package:route_ecommerce/Features/favorite/data/model/remove_favorite_model.dart';

import '../../../../Core/utils/errors/error_message_model.dart';
import '../../../../Core/utils/errors/exception.dart';

abstract class FavoriteBaseRemoteDateSource{
  Future<AddFavoriteModel> addFavorite({required String productId});
  Future<RemoveFavoriteModel> removeFavorite({required String productId});
  Future<FavoriteModel> getFavorite();

}

class FavoriteRemoteDataSource extends FavoriteBaseRemoteDateSource{
  
  final ApiService apiService;

  FavoriteRemoteDataSource({required this.apiService});
  @override
  Future<AddFavoriteModel> addFavorite({required String productId})async{
    var response = await apiService.postMethod("wishlist",
        {
            "productId": productId
        },
        SharedPref.getToken().toString(),
    );
    if (response.statusCode == 200){
      final Map<String, dynamic> productFav = response.data;
      // print("@@@@@");
      // print(productFav);
      return AddFavoriteModel.fromJson(productFav);
    }else{
      throw ServerException(
        errorMessageModel: ErrorMessageModel.fromJson(response.data),
      );
    }
  }

  @override
  Future<RemoveFavoriteModel> removeFavorite({required String productId})async{
    var response = await apiService.delete(endPoint: "wishlist/$productId",
        token: SharedPref.getToken().toString(),
    );
    if (response.statusCode == 200){
      final Map<String, dynamic> productFav = response.data;
      // print("@@@@@");
      // print(productFav);
      return RemoveFavoriteModel.fromJson(productFav);
    }else{
      throw ServerException(
        errorMessageModel: ErrorMessageModel.fromJson(response.data),
      );
    }
  }

  @override
  Future<FavoriteModel> getFavorite()async{
    var response = await apiService.getCart(endpoint: "wishlist",
        token: SharedPref.getToken()
    );
    if (response.statusCode == 200){
      final Map<String, dynamic> productFav = response.data;
      // print(productFav);
      return FavoriteModel.fromJson(productFav);
    }else{
      throw ServerException(
        errorMessageModel: ErrorMessageModel.fromJson(response.data),
      );
    }
  }

}