import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:route_ecommerce/Core/base_use_case/base_use_case.dart';
import 'package:route_ecommerce/Features/category/domain/use_case/product_use_case.dart';
import 'package:route_ecommerce/Features/category/presentation/view_manager/product_cubit/product_state.dart';

class ProductCubit extends Cubit<ProductState> {
  ProductCubit(this.productUseCase) : super(ProductInitial());
  final ProductUseCase productUseCase;

  Future<void> getProduct() async {
    emit(ProductLoading());
    var result = await productUseCase.call(const NoParameters());
    result.fold((e) {
      emit(ProductFailure(errMessage: e.message));
    }, (productModel) {
      emit(ProductSuccess(productModel: productModel));
    });
  }
}
