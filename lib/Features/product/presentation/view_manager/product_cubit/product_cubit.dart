// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:route_ecommerce/Core/base_use_case/base_use_case.dart';
// import 'package:route_ecommerce/Features/category/domain/use_case/product_use_case.dart';
// import 'package:route_ecommerce/Features/category/presentation/view_manager/product_cubit/product_state.dart';
//
// import '../../../domain/use_case/add_cart_use_case.dart';
//
// class ProductCubit extends Cubit<ProductState> {
//   ProductCubit(this.productUseCase, this.addCartUseCase) : super(ProductInitial());
//   final ProductUseCase productUseCase;
//   final AddCartUseCase addCartUseCase;
//
//   static ProductCubit get(context)=> BlocProvider.of(context);
//
//   Future<void> getProduct() async {
//     emit(ProductLoading());
//     var result = await productUseCase.call(const NoParameters());
//     result.fold((e) {
//       emit(ProductFailure(errMessage: e.message));
//     }, (productModel) {
//       emit(ProductSuccess(productModel: productModel));
//     });
//   }
//
//   int numOfCartItems= 0;
//   Future<void> addCart({required String productId}) async {
//     // emit(AddCartLoading());
//     var result = await addCartUseCase.call(productId);
//     result.fold((e) {
//       emit(AddCartFailure(errMessage: e.message));
//     }, (addCartModel) {
//       numOfCartItems=addCartModel.numOfCartItems ?? 0;
//       print("numOfCartItems :$numOfCartItems");
//       emit(AddCartSuccess(addCartModel: addCartModel));
//       // getProduct();
//     });
//   }
// }
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:route_ecommerce/Features/product/presentation/view_manager/product_cubit/product_state.dart';
import '../../../../../Core/base_use_case/base_use_case.dart';
import '../../../domain/use_case/add_cart_use_case.dart';
import '../../../domain/use_case/product_use_case.dart';

class ProductCubit extends Cubit<ProductState> {
  ProductCubit(this.productUseCase, this.addCartUseCase) : super(ProductInitial());
  final ProductUseCase productUseCase;
  final AddCartUseCase addCartUseCase;

  static ProductCubit get(context) => BlocProvider.of(context);

  dynamic currentProductModel; // Store current products

  Future<void> getProduct() async {
    emit(ProductLoading());
    var result = await productUseCase.call(const NoParameters());
    result.fold((e) {
      emit(ProductFailure(errMessage: e.message));
    }, (productModel) {
      currentProductModel = productModel;
      emit(ProductSuccess(productModel: productModel));
    });
  }

  int numOfCartItems = 0;
  Future<void> addCart({required String productId}) async {
    emit(AddCartLoading(currentProductModel: currentProductModel));
    var result = await addCartUseCase.call(productId);
    result.fold((e) {
      emit(AddCartFailure(
          errMessage: e.message,
          currentProductModel: currentProductModel
      ));
    }, (addCartModel) {
      numOfCartItems = addCartModel.numOfCartItems ?? 0;
      print("numOfCartItems :$numOfCartItems");
      emit(AddCartSuccess(
          addCartModel: addCartModel,
          currentProductModel: currentProductModel
      ));
    });
  }
}