import 'package:dartz/dartz.dart';
import 'package:route_ecommerce/Features/Auth/data/models/change_my_password_model.dart';
import 'package:route_ecommerce/Features/Auth/domain/repo/auth_repo.dart';

import '../../../../Core/utils/errors/failure.dart';

class ChangePasswordUseCase {
  final AuthRepo authRepo;

  ChangePasswordUseCase({required this.authRepo});

  Future<Either<Failure, ChangeMyPasswordModel>> call(
      {required String currentPassword,
      required String password,
      required String rePassword}) async {
    return await authRepo.changePassword(
        currentPassword: currentPassword,
        password: password,
        rePassword: rePassword);
  }
}
