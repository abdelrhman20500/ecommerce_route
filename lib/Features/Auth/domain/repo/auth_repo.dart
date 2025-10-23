import 'package:dartz/dartz.dart';
import 'package:route_ecommerce/Features/Auth/data/models/auth_model.dart';
import 'package:route_ecommerce/Features/Auth/data/models/change_my_password_model.dart';
import 'package:route_ecommerce/Features/Auth/data/models/verify_reset_code_model.dart';
import '../../../../Core/utils/errors/failure.dart';
import '../../data/models/forget_password_model.dart';

abstract class AuthRepo{
  Future<Either<Failure,AuthModel>> userLogin({required String email, required String password});
  Future<Either<Failure,AuthModel>> userRegister({required String email, required String password,
  required String rePassword, required String phone, required String name});
  Future<Either<Failure,ForgetPasswordModel>> forgetPassword({required String email});
  Future<Either<Failure,VerifyResetCodeModel>> verifyCode({required String code});
  Future<Either<Failure,ChangeMyPasswordModel>> changePassword(
  {required String currentPassword, required String password,required String rePassword});
}