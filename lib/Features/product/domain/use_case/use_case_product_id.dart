import 'package:dartz/dartz.dart';
import 'package:route_ecommerce/Core/base_use_case/base_use_case.dart';
import 'package:route_ecommerce/Core/utils/errors/failure.dart';
import '../../data/model/product_details_model.dart';
import '../repo/product_repo.dart';

class UseCaseProductId extends BaseUseCase<ProductDetailsModel, String> {
  final ProductRepo productRepo;

  UseCaseProductId(this.productRepo);

  @override
  Future<Either<Failure, ProductDetailsModel>> call([String? productId]) async {
    return await productRepo.productId(productId: productId!);
  }
}
