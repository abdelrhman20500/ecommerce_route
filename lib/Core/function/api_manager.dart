import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:route_ecommerce/Features/Auth/data/models/auth_model.dart';

class ApiManager {
  final Dio _dio;

  ApiManager(this._dio);

  Future<AuthModel> login({
    required String email,
    required String password,
  }) async {
    const url = "https://ecommerce.routemisr.com/api/v1/auth/signin";
    try {
      final response = await _dio.post(
        url,
        data: jsonEncode({
          "email": email,
          "password": password,
        }),
        options: Options(
          headers: {
            "Content-Type": "application/json",
          },
        ),
      );

      if (response.statusCode != null &&
          response.statusCode! >= 200 &&
          response.statusCode! < 300) {
        final authModel = AuthModel.fromJson(response.data);
        print(authModel.user!.email);
        print(authModel.message);
        return authModel;
      } else {
        print("❌ Registration failed: ${response.statusCode}");
        throw Exception("Failed to register: ${response.data}");
      }
    } on DioException catch (e) {
      // Handle DioException specifically
      if (e.response != null) {
        // You can check the status code and provide specific messages
        if (e.response!.statusCode == 409) {
          throw Exception("Conflict: The email or phone number is already registered.");
        } else {
          throw Exception("Failed to register: ${e.response!.data}");
        }
      } else {
        throw Exception("Failed to register: ${e.message}");
      }
    } catch (e) {
      // Handle any other exceptions
      throw Exception("An unexpected error occurred: $e");
    }
  }
}