// import 'package:route_ecommerce/Features/category/data/model/product_model.dart';
//
// import '../../../data/model/add_cart_model.dart';
//
// abstract class ProductState{}
// class ProductInitial extends ProductState{}
// class ProductLoading extends ProductState{}
// class ProductFailure extends ProductState{
//   final String errMessage;
//   ProductFailure({required this.errMessage});
// }
// class ProductSuccess extends ProductState{
//   final List<ProductModel> productModel;
//   ProductSuccess({required this.productModel});
// }
// class AddCartLoading extends ProductState{}
// class AddCartFailure extends ProductState{
//   final String errMessage;
//   AddCartFailure({required this.errMessage});
// }
// class AddCartSuccess extends ProductState{
//   final AddCartModel addCartModel;
//   AddCartSuccess({required this.addCartModel});
// }

// In your state file
abstract class ProductState {}

class ProductInitial extends ProductState {}

class ProductLoading extends ProductState {}

class ProductSuccess extends ProductState {
  final dynamic productModel;
  ProductSuccess({required this.productModel});
}

class ProductFailure extends ProductState {
  final String errMessage;
  ProductFailure({required this.errMessage});
}

class AddCartLoading extends ProductState {
  final dynamic currentProductModel; // Keep current data
  AddCartLoading({required this.currentProductModel});
}

class AddCartSuccess extends ProductState {
  final dynamic addCartModel;
  final dynamic currentProductModel; // Keep current data
  AddCartSuccess({required this.addCartModel, required this.currentProductModel});
}

class AddCartFailure extends ProductState {
  final String errMessage;
  final dynamic currentProductModel; // Keep current data
  AddCartFailure({required this.errMessage, required this.currentProductModel});
}