import 'package:dartz/dartz.dart';
import 'package:route_ecommerce/Core/base_use_case/base_use_case.dart';
import 'package:route_ecommerce/Core/utils/errors/failure.dart';
import 'package:route_ecommerce/Features/cart/data/model/cart_model.dart';
import 'package:route_ecommerce/Features/cart/domain/repo/cart_repo.dart';

class CartUserUseCase extends BaseUseCase<CartModel, NoParameters>{
  final CartRepo cartRepo;

  CartUserUseCase( this.cartRepo);
  @override
  Future<Either<Failure, CartModel>> call(NoParameters parameters)async{
   return await cartRepo.getCartUser();
  }

}