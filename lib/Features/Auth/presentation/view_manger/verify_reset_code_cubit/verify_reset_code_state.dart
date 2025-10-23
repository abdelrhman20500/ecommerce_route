
import 'package:route_ecommerce/Features/Auth/data/models/verify_reset_code_model.dart';

abstract class VerifyResetCodeState {}

final class VVerifyResetCodeInitial extends VerifyResetCodeState {}

final class VerifyResetCodeLoading extends VerifyResetCodeState {}

final class VerifyResetCodeSuccess extends VerifyResetCodeState {
  final VerifyResetCodeModel verifyResetCodeModel;

  VerifyResetCodeSuccess({required this.verifyResetCodeModel});
}

final class VerifyResetCodeFailure extends VerifyResetCodeState {
  final String errMessage;
  VerifyResetCodeFailure(this.errMessage);
}
