import 'package:route_ecommerce/Features/cart/data/model/cart_model.dart';

abstract class CartState{}
class CartInitial extends CartState{}
class CartLoading extends CartState{}
class CartFailure extends CartState{
  final String errMessage;
  CartFailure({required this.errMessage});
}
class CartSuccess extends CartState{
  final CartModel cartModel;
  CartSuccess({required this.cartModel});
}
class DeleteItemCartLoading extends CartState{}
class DeleteItemFailure extends CartState{
  final String errMessage;
  DeleteItemFailure({required this.errMessage});
}
class DeleteItemSuccess extends CartState{
  final CartModel cartModel;
  DeleteItemSuccess({required this.cartModel});
}
class UpdateCountCartLoading extends CartState{}
class UpdateCountCartFailure extends CartState{
  final String errMessage;
  UpdateCountCartFailure({required this.errMessage});
}
class UpdateCountCartSuccess extends CartState{
  final CartModel cartModel;
  UpdateCountCartSuccess({required this.cartModel});
}