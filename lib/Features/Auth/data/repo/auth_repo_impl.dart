import 'package:route_ecommerce/Core/function/api_service.dart';
import 'package:route_ecommerce/Core/utils/shared_preferences.dart';
import 'package:route_ecommerce/Features/Auth/data/models/auth_model.dart';
import 'package:route_ecommerce/Features/Auth/domain/repo/auth_repo.dart';

class AuthRepoImpl implements AuthRepo{
  final ApiService apiService;

  AuthRepoImpl({required this.apiService});

  @override
  Future<AuthModel> userLogin({required String email, required String password})async{
    var response = await apiService.post("auth/signin",{
      "email":email,
      "password":password
    });
    if(response.statusCode ==200){
      final authModel = AuthModel.fromJson(response.data);
      /// Save token...
      SharedPref.saveToken(authModel.token!);
      print(authModel.message);
      print(authModel.token);
      print(authModel.user!.email);
      return authModel;
    }else{
      throw Exception('Failed to login'); // Handle error appropriately
    }
  }

  @override
  Future<AuthModel> userRegister({
    required String email,
    required String password,
    required String rePassword,
    required String phone,
    required String name,
  }) async {
    try {
      var response = await apiService.post("auth/signup", {
        "name": name,
        "email": email,
        "password": password,
        "rePassword": rePassword,
        "phone": phone,
      });
      if (response.statusCode == 201) {
        final authModel = AuthModel.fromJson(response.data);
        /// Save token...
        SharedPref.saveToken(authModel.token!);
        print("Registration successful: ${authModel.message}");
        print("Token: ${authModel.token}");
        print("User  Email: ${authModel.user!.email}");
        return authModel;
      } else {
        print("Registration failed with status: ${response.statusCode}");
        throw Exception('Failed to Register'); // Handle error appropriately
      }
    } catch (e) {
      print("Error during registration: $e");
      throw Exception('Failed to Register: $e');
    }
    }
}