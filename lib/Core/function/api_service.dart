import 'package:dio/dio.dart';

class ApiService{
  final Dio dio;
  final baseUrl = "https://ecommerce.routemisr.com/api/v1/";

  ApiService(this.dio);
  /// post method...
  Future<Response> post(String endPoint, Map<String, dynamic> data,) async {
    var response = await dio.post(
      "$baseUrl$endPoint",
      data: data,
      options: Options(headers: {
        'Content-Type': 'application/json',
        // 'Authorization': 'Bearer $token',
      }),
    );

    return response;
  }

  /// postCart method
  Future<Response> postCart(String endPoint, Map<String, dynamic> data, String token) async {
    return await dio.post(
      '$baseUrl$endPoint',
      data: data,
      options: Options(
        headers: {
          'Content-Type': 'application/json',
          'token': token,
        },
      ),
    );
  }
 /// getCart method
  Future<Response> getCart({required String endpoint ,String? token}) async {
    var response = await dio.get("$baseUrl$endpoint",
      options:Options(headers: {
        'Content-Type': 'application/json',
        'token': token,
      }),
    );
    return response;
  }
  /// logout
  Future<Response> postLogout(String endPoint,) async {
    var response = await dio.post(
      "$baseUrl$endPoint",
      // data: data,
      options: Options(headers: {
        'Content-Type': 'application/json',
        // 'Authorization': 'Bearer $token',
      }),
    );

    return response;
  }
  /// delete method
  Future<Response> delete({required String endPoint,required String token,}) async {
    final response = await dio.delete(
      "$baseUrl$endPoint", // this must be a full URL
      options: Options(
        headers: {
          'Content-Type': 'application/json',
          'Authorization': 'Bearer $token',
        },
      ),
    );
    return response;
  }

  /// get method..
  Future<Response> get({required String endpoint ,String? token}) async {
    var response = await dio.get("$baseUrl$endpoint",
      options:Options(headers: {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer $token',
      }),
    );
    return response;
  }



}

