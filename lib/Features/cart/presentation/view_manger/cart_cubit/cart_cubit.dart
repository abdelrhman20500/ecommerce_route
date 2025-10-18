import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:route_ecommerce/Features/cart/data/model/cart_model.dart';
import 'package:route_ecommerce/Features/cart/domain/use_case/cart_user_use_case.dart';
import 'package:route_ecommerce/Features/cart/presentation/view_manger/cart_cubit/cart_state.dart';

import '../../../../../Core/base_use_case/base_use_case.dart';

class CartCubit extends Cubit<CartState>{
  CartCubit(this.cartUserUseCase): super(CartInitial());
  final CartUserUseCase cartUserUseCase;

  List<GetProductsCart> getDataCart=[];
  Future<void>getCart()async {
    emit(CartLoading());
    var result = await cartUserUseCase.call(const NoParameters());
    result.fold((e) {
      emit(CartFailure(errMessage: e.message));
    }, (cartModel) {
      getDataCart= cartModel.data?.products ?? [];
      print(getDataCart);
      emit(CartSuccess(cartModel: cartModel));
    });
  }
}