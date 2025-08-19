import 'package:route_ecommerce/Features/Auth/data/models/auth_model.dart';

abstract class AuthRepo{
  Future<AuthModel> userLogin({required String email, required String password});
  Future<AuthModel> userRegister({required String email, required String password,
  required String rePassword, required String phone, required String name});
}