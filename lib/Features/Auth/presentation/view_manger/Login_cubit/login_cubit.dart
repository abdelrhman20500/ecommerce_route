import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:route_ecommerce/Features/Auth/domain/use_case/login_use_case.dart';
import 'package:route_ecommerce/Features/Auth/presentation/view_manger/Login_cubit/login_state.dart';

class LoginCubit extends Cubit<LoginState>{
  LoginCubit(this.loginUseCase) : super(LoginInitial());
  final LoginUseCase loginUseCase;
  Future<void> login(String email, String password) async {
    emit(LoginLoading());
    try {
      final result = await loginUseCase.call(
        email: email,
        password: password,
      );
      emit(LoginSuccess(authModel: result));
    } catch (e) {
      emit(LoginFailure(error: e.toString()));
    }
  }
}