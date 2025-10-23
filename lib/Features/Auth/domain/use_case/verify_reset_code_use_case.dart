import 'package:dartz/dartz.dart';
import 'package:route_ecommerce/Features/Auth/data/models/verify_reset_code_model.dart';
import 'package:route_ecommerce/Features/Auth/domain/repo/auth_repo.dart';

import '../../../../Core/utils/errors/failure.dart';

class VerifyResetCodeUseCase {
  final AuthRepo authRepo;

  VerifyResetCodeUseCase(this.authRepo);

  Future<Either<Failure, VerifyResetCodeModel>> call(
      {required String code}) async {
    return await authRepo.verifyCode(code: code);
  }
}
