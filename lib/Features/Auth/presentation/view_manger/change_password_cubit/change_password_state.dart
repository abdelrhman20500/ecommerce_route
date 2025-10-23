
import 'package:route_ecommerce/Features/Auth/data/models/change_my_password_model.dart';

abstract class ChangePasswordState {}

final class ChangePasswordInitial extends ChangePasswordState {}

final class ChangePasswordLoading extends ChangePasswordState {}

final class ChangePasswordSuccess extends ChangePasswordState {
  final ChangeMyPasswordModel changeMyPasswordModel;

  ChangePasswordSuccess({required this.changeMyPasswordModel});
}

final class ChangePasswordFailure extends ChangePasswordState {
  final String errMessage;
  ChangePasswordFailure(this.errMessage);
}
