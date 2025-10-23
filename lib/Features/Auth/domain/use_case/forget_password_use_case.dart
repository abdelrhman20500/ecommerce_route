
import 'package:dartz/dartz.dart';
import 'package:route_ecommerce/Core/utils/errors/failure.dart';
import '../../data/models/forget_password_model.dart';
import '../repo/auth_repo.dart';

class ForgetPasswordUseCase{
  final AuthRepo authRepo;
  ForgetPasswordUseCase(this.authRepo);
  Future<Either<Failure, ForgetPasswordModel>> call({required String email})async{
    return await authRepo.forgetPassword(email: email);
  }
}