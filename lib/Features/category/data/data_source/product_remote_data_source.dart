import 'package:route_ecommerce/Core/function/api_service.dart';
import 'package:route_ecommerce/Core/utils/shared_preferences.dart';
import 'package:route_ecommerce/Features/category/data/model/add_cart_model.dart';
import 'package:route_ecommerce/Features/category/data/model/product_details_model.dart';
import 'package:route_ecommerce/Features/category/data/model/product_model.dart';
import '../../../../Core/utils/errors/error_message_model.dart';
import '../../../../Core/utils/errors/exception.dart';

abstract class ProductBaseRemoteDataSource {
  Future<List<ProductModel>> getProduct();
  Future<ProductDetailsModel>productId({required String productId});
  Future<AddCartModel>addCart({required String productId});

}

class ProductRemoteDataSource extends ProductBaseRemoteDataSource{
  final ApiService apiService;

  ProductRemoteDataSource({required this.apiService});
  @override
  Future<List<ProductModel>> getProduct() async{
    var response = await apiService.get(endpoint: "products?limit=20");

    if (response.statusCode == 200) {
      final List<dynamic> dataList = response.data['data'];
      // print(dataList);
      return dataList.map((e) => ProductModel.fromJson(e)).toList();
    } else {
      throw ServerException(
        errorMessageModel: ErrorMessageModel.fromJson(response.data),
      );
    }
  }

  @override
  Future<ProductDetailsModel> productId({required String productId})async{
    var response = await apiService.get(endpoint: "products/$productId");
    if (response.statusCode == 200){
      final Map<String, dynamic> productJson = response.data;
      return ProductDetailsModel.fromJson(productJson);
    }else{
      throw ServerException(
        errorMessageModel: ErrorMessageModel.fromJson(response.data),
      );
    }
  }

  @override
  Future<AddCartModel> addCart({required String productId})async{
    var response = await apiService.postCart("cart", {
      "productId": productId,
    }, SharedPref.getToken().toString()
    );
    if (response.statusCode == 200){
      final Map<String, dynamic> productCart = response.data;
      print(productCart);
      return AddCartModel.fromJson(productCart);
    }else{
      throw ServerException(
        errorMessageModel: ErrorMessageModel.fromJson(response.data),
      );
    }
  }
}