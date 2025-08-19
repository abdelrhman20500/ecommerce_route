import 'package:route_ecommerce/Features/Auth/data/models/auth_model.dart';
import '../repo/auth_repo.dart';

class RegisterUseCase {
  final AuthRepo authRepo;
  RegisterUseCase(this.authRepo);
  Future<AuthModel> call(
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
