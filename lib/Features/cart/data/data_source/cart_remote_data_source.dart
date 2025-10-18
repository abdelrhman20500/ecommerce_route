import 'package:route_ecommerce/Core/function/api_service.dart';
import 'package:route_ecommerce/Features/cart/data/model/cart_model.dart';

import '../../../../Core/utils/errors/error_message_model.dart';
import '../../../../Core/utils/errors/exception.dart';
import '../../../../Core/utils/shared_preferences.dart';

abstract class CartBaseRemoteDataSource{
  Future<CartModel> getCart();
}

class CartRemoteDataSource extends CartBaseRemoteDataSource{
  final ApiService apiService;
  CartRemoteDataSource({required this.apiService});
  @override
  Future<CartModel> getCart()async{
    var response = await apiService.getCart(endpoint: "cart",
        token: SharedPref.getToken()
    );
    if (response.statusCode == 200){
      final Map<String, dynamic> productCart = response.data;
      print(productCart);
      return CartModel.fromJson(productCart);
    }else{
      throw ServerException(
        errorMessageModel: ErrorMessageModel.fromJson(response.data),
      );
    }
  }
}