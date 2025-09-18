import 'package:dartz/dartz.dart';
import 'package:route_ecommerce/Features/Auth/data/models/auth_model.dart';
import '../../../../Core/utils/error/failure.dart';
import '../repo/auth_repo.dart';

class LoginUseCase{
  final AuthRepo authRepo;
  LoginUseCase(this.authRepo);
  Future<Either<Failure,AuthModel>> call({required String email,required String password}) async {
    return await authRepo.userLogin(email: email, password: password);
  }
}