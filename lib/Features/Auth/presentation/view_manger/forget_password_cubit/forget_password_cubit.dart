import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../domain/use_case/forget_password_use_case.dart';
import 'forget_password_state.dart';

class ForgetPasswordCubit extends Cubit<ForgetPasswordState>{
  ForgetPasswordCubit(this.forgetPasswordUseCase): super(ForgetPasswordInitial());

  final ForgetPasswordUseCase forgetPasswordUseCase;
  Future<void> forgetPassword(String email,) async {
    emit(ForgetPasswordLoading());
    final result = await forgetPasswordUseCase.call(
      email: email,
    );
    result.fold((failure){
      emit(ForgetPasswordFailure(errMessage: failure.message));
    },(forgetPasswordModel){
      emit(ForgetPasswordSuccess(forgetPasswordModel: forgetPasswordModel));
    });
  }
}