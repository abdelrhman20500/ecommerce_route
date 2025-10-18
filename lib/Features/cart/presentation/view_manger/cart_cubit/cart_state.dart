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