import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:route_ecommerce/Features/Auth/domain/use_case/verify_reset_code_use_case.dart';
import 'package:route_ecommerce/Features/Auth/presentation/view_manger/verify_reset_code_cubit/verify_reset_code_state.dart';

class VerifyResetCodeCubit extends Cubit<VerifyResetCodeState> {
  VerifyResetCodeCubit(this.verifyResetCodeUseCase) : super(VVerifyResetCodeInitial());

  final VerifyResetCodeUseCase verifyResetCodeUseCase;
  Future<void> verifyCode(String code) async {
    emit(VerifyResetCodeLoading());
    final result = await verifyResetCodeUseCase.call(
      code: code
    );
    result.fold((failure){
      emit(VerifyResetCodeFailure(failure.message));
    },(verifyResetCodeModel){
      emit(VerifyResetCodeSuccess(verifyResetCodeModel:verifyResetCodeModel));
    });
  }
}
