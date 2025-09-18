import 'package:dartz/dartz.dart';
import 'package:route_ecommerce/Features/Auth/data/models/auth_model.dart';
import '../../../../Core/utils/error/failure.dart';
import '../repo/auth_repo.dart';

class RegisterUseCase {
  final AuthRepo authRepo;
  RegisterUseCase(this.authRepo);
  Future<Either<Failure,AuthModel>> call(
      {required String email,
      required String password,
      required String rePassword,
      required String phone,
      required String name}) async {
    return await authRepo.userRegister(
        email: email,
        password: password,
        rePassword: rePassword,
        phone: phone,
        name: name);
  }
}
