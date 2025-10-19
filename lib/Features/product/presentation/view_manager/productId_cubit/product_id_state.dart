
import '../../../data/model/product_details_model.dart';

abstract class ProductIdState{}
class ProductIdInitial extends ProductIdState{}
class ProductIdLoading extends ProductIdState{}
class ProductIdFailure extends ProductIdState{
  final String errMessage;
  ProductIdFailure({required this.errMessage});
}
class ProductIdSuccess extends ProductIdState{
  final ProductDetailsModel productDetailsModel;
  ProductIdSuccess({required this.productDetailsModel});
}