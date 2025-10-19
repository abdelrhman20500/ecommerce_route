import 'package:dartz/dartz.dart';
import 'package:route_ecommerce/Core/base_use_case/base_use_case.dart';
import 'package:route_ecommerce/Core/utils/errors/failure.dart';
import '../../data/model/add_cart_model.dart';
import '../repo/product_repo.dart';

class AddCartUseCase extends BaseUseCase<AddCartModel, String>{
  final ProductRepo productRepo;

  AddCartUseCase({required this.productRepo});
  @override
  Future<Either<Failure, AddCartModel>> call([String? productId])async{
    return await productRepo.addCart(productId: productId!);
  }

}