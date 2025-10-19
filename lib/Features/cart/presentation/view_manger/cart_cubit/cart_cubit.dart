import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:route_ecommerce/Features/cart/data/model/cart_model.dart';
import 'package:route_ecommerce/Features/cart/domain/repo/cart_repo.dart';
import 'package:route_ecommerce/Features/cart/domain/use_case/cart_user_use_case.dart';
import 'package:route_ecommerce/Features/cart/domain/use_case/delete_cart_use_case.dart';
import 'package:route_ecommerce/Features/cart/domain/use_case/update_count_cart_use_case.dart';
import 'package:route_ecommerce/Features/cart/presentation/view_manger/cart_cubit/cart_state.dart';

import '../../../../../Core/base_use_case/base_use_case.dart';

class CartCubit extends Cubit<CartState>{
  CartCubit(this.cartUserUseCase, this.deleteCartUseCase,
      this.updateCountCartUseCase): super(CartInitial());
  final CartUserUseCase cartUserUseCase;
  final DeleteCartUseCase deleteCartUseCase;
  final UpdateCountCartUseCase updateCountCartUseCase;

  static CartCubit get(context) => BlocProvider.of(context);


  List<GetProductsCart> getDataCart=[];
  Future<void>getCart()async {
    emit(CartLoading());
    var result = await cartUserUseCase.call(const NoParameters());
    result.fold((e) {
      emit(CartFailure(errMessage: e.message));
    }, (cartModel) {
      getDataCart= cartModel.data?.products ?? [];
      // print(getDataCart);
      emit(CartSuccess(cartModel: cartModel));
    });
  }
  Future<void>deleteItemCart({required String productId})async {
    // emit(DeleteItemCartLoading());
    var result = await deleteCartUseCase.call(productId);
    result.fold((e) {
      emit(DeleteItemFailure(errMessage: e.message));
    }, (cartModel) {
      getDataCart= cartModel.data?.products ?? [];
      emit(CartSuccess(cartModel: cartModel));
    });
  }
  Future<void>updateCountCart({required String productId, required int count})async {
    // emit(CartLoading());
    var result = await
    updateCountCartUseCase.call(UpdateCountCartParameters(productId: productId, count: count));
    result.fold((e) {
      emit(UpdateCountCartFailure(errMessage: e.message));
    }, (cartModel) {
      getDataCart= cartModel.data?.products ?? [];
      // print(getDataCart);
      emit(CartSuccess(cartModel: cartModel));
    });
  }

}