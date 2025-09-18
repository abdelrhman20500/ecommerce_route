import 'package:dartz/dartz.dart';
import 'package:route_ecommerce/Features/Auth/data/models/auth_model.dart';
import '../../../../Core/utils/error/failure.dart';

abstract class AuthRepo{
  Future<Either<Failure,AuthModel>> userLogin({required String email, required String password});
  Future<Either<Failure,AuthModel>> userRegister({required String email, required String password,
  required String rePassword, required String phone, required String name});
}