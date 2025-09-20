import 'package:route_ecommerce/Core/function/api_service.dart';
import 'package:route_ecommerce/Features/category/data/model/product_model.dart';
import '../../../../Core/utils/errors/error_message_model.dart';
import '../../../../Core/utils/errors/exception.dart';

abstract class ProductBaseRemoteDataSource {
  Future<List<ProductModel>> getProduct();
}

class ProductRemoteDataSource extends ProductBaseRemoteDataSource{
  final ApiService apiService;

  ProductRemoteDataSource({required this.apiService});
  @override
  Future<List<ProductModel>> getProduct() async{
    var response = await apiService.get(endpoint: "products");

    if (response.statusCode == 200) {
      final List<dynamic> dataList = response.data['data'];
      print(dataList);
      return dataList.map((e) => ProductModel.fromJson(e)).toList();
    } else {
      throw ServerException(
        errorMessageModel: ErrorMessageModel.fromJson(response.data),
      );
    }
  }
}