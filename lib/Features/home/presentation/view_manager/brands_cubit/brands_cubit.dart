import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:route_ecommerce/Features/home/presentation/view_manager/brands_cubit/brands_state.dart';
import '../../../../../Core/base_use_case/base_use_case.dart';
import '../../../domain/use_case/brands_use_case.dart';


class BrandsCubit extends Cubit<BrandsState>{
  BrandsCubit(this.brandsUseCase): super(BrandsInitial());
  final BrandsUseCase brandsUseCase;


  Future<void> brandsData() async {
    emit(BrandsLoading());
    var result = await brandsUseCase.call(const NoParameters());
    result.fold((e) {
      emit(BrandsFailure(errMessage: e.message));
    }, (brandsEntity) {
      emit(BrandsSuccess(brandsEntity: brandsEntity));
    });
  }
}