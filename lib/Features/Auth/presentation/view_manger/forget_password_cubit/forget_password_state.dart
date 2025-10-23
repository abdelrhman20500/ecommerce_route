import '../../../data/models/forget_password_model.dart';

abstract class ForgetPasswordState {}

final class ForgetPasswordInitial extends ForgetPasswordState {}

final class ForgetPasswordLoading extends ForgetPasswordState {}

final class ForgetPasswordSuccess extends ForgetPasswordState {
  final ForgetPasswordModel forgetPasswordModel;

  ForgetPasswordSuccess({required this.forgetPasswordModel});
}

final class ForgetPasswordFailure extends ForgetPasswordState {
  final String errMessage;

  ForgetPasswordFailure({required this.errMessage});

}
