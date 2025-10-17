// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:route_ecommerce/Features/category/domain/use_case/add_cart_use_case.dart';
// import 'package:route_ecommerce/Features/category/presentation/view_manager/add_cart_cubit/add_cart_state.dart';
//
// class AddCartCubit extends Cubit<AddCartState> {
//   AddCartCubit(this.addCartUseCase) : super(AddCartInitial());
//   final AddCartUseCase addCartUseCase;
//   int numOfCartItems= 0;
//   Future<void> addCart({required String productId}) async {
//     emit(AddCartLoading());
//     var result = await addCartUseCase.call(productId);
//     result.fold((e) {
//       emit(AddCartFailure(errMessage: e.message));
//     }, (addCartModel) {
//       numOfCartItems=addCartModel.numOfCartItems ?? 0;
//       print("numOfCartItems :$numOfCartItems");
//       emit(AddCartSuccess(addCartModel: addCartModel));
//     });
//   }
// }
