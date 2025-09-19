import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../Core/base_use_case/base_use_case.dart';
import '../../domain/use_case/category_use_case.dart';
import 'category_state.dart';


class CategoryCubit extends Cubit<CategoryState>{
  CategoryCubit(this.categoryUseCase): super(CategoryInitial());
  final CategoryUseCase categoryUseCase;

  Future<void> categoryDate() async {
    emit(CategoryLoading());
    var result = await categoryUseCase.call(const NoParameters());
    result.fold((e) {
      emit(CategoryFailure(errMessage: e.message));
    }, (categoryEntity) {
      emit(CategorySuccess(categoryModel: categoryEntity));
    });
  }
}