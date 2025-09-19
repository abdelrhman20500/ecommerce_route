import '../../data/model/category_model.dart';

abstract class CategoryState{}
class CategoryInitial extends CategoryState{}
class CategoryLoading extends CategoryState{}
class CategoryFailure extends CategoryState{
  final String errMessage;
  CategoryFailure({required this.errMessage});
}
class CategorySuccess extends CategoryState{
  final List<CategoryModel> categoryModel;
  CategorySuccess({required this.categoryModel});
}