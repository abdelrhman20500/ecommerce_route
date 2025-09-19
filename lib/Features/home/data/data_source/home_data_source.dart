import 'package:route_ecommerce/Core/function/api_service.dart';
import '../../../../Core/utils/errors/error_message_model.dart';
import '../../../../Core/utils/errors/exception.dart';
import '../model/category_model.dart';

abstract class HomeBaseRemoteDataSource{
  Future<List<CategoryModel>> getCategoryData();
}

class HomeRemoteDataSource extends HomeBaseRemoteDataSource{
  final ApiService apiService;

  HomeRemoteDataSource({required this.apiService});
  @override
  Future<List<CategoryModel>> getCategoryData() async {
    var response = await apiService.get(endpoint: "categories");

    if (response.statusCode == 200) {
      final List<dynamic> dataList = response.data['data'];
      // print(dataList);
      return dataList.map((e) => CategoryModel.fromJson(e)).toList();
    } else {
      throw ServerException(
        errorMessageModel: ErrorMessageModel.fromJson(response.data),
      );
    }
  }

}