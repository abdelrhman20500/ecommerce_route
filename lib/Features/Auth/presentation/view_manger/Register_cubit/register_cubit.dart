import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:route_ecommerce/Features/Auth/domain/use_case/register_use_case.dart';
import 'package:route_ecommerce/Features/Auth/presentation/view_manger/Register_cubit/register_state.dart';

class RegisterCubit extends Cubit<RegisterState>{
  RegisterCubit(this.registerUseCase) : super(RegisterInitial());
  final RegisterUseCase registerUseCase;
  Future<void> register(String email, String password, String name, String rePassword,
      String phone) async {
    emit(RegisterLoading());
    try {
      final result = await registerUseCase.call(
          email: email,
          password: password,
          rePassword: rePassword,
          phone: phone,
          name: name
      );
      emit(RegisterSuccess(authModel: result));
    } catch (e) {
      emit(RegisterFailure(error: e.toString()));
    }
  }
}