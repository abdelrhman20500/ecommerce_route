import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:route_ecommerce/Features/Auth/domain/use_case/change_password_use_case.dart';
import 'package:route_ecommerce/Features/Auth/presentation/view_manger/change_password_cubit/change_password_state.dart';


class ChangePasswordCubit extends Cubit<ChangePasswordState> {
  ChangePasswordCubit(this.changePasswordUseCase) : super(ChangePasswordInitial());

  final ChangePasswordUseCase changePasswordUseCase;
  Future<void> changePassword(String currentPassword, String password, String rePassword) async {
    emit(ChangePasswordLoading());
    final result = await changePasswordUseCase.call(
        currentPassword: currentPassword, password: password, rePassword: rePassword);
    result.fold((failure){
      print(failure.message);
      emit(ChangePasswordFailure(failure.message));
    },(changeMyPasswordModel){
      emit(ChangePasswordSuccess(changeMyPasswordModel:changeMyPasswordModel));
    });
  }
}
