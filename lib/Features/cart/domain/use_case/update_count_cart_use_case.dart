import 'package:dartz/dartz.dart';
import 'package:route_ecommerce/Core/base_use_case/base_use_case.dart';
import 'package:route_ecommerce/Core/utils/errors/failure.dart';
import 'package:route_ecommerce/Features/cart/data/model/cart_model.dart';
import 'package:route_ecommerce/Features/cart/domain/repo/cart_repo.dart';

class UpdateCountCartUseCase extends BaseUseCase<CartModel, UpdateCountCartParameters> {
  final CartRepo cartRepo;

  UpdateCountCartUseCase({required this.cartRepo});

  @override
  Future<Either<Failure, CartModel>> call(UpdateCountCartParameters parameters) {
    return cartRepo.updateCountCart(parameters);
  }
}
