import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:route_ecommerce/Features/product/presentation/view_manager/productId_cubit/product_id_state.dart';

import '../../../domain/use_case/use_case_product_id.dart';

class ProductIdCubit extends Cubit<ProductIdState>{
  ProductIdCubit(this.useCaseProductId): super(ProductIdInitial());
  final UseCaseProductId useCaseProductId;
  Future<void> productIdDate({required String id}) async {
    emit(ProductIdLoading());
    var result = await useCaseProductId.call(id);
    result.fold((e) {
      emit(ProductIdFailure(errMessage: e.message));
    }, (productDetailsModel) {
      emit(ProductIdSuccess(productDetailsModel: productDetailsModel));
    });
  }
}