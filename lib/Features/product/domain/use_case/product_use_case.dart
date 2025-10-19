import 'package:dartz/dartz.dart';
import 'package:route_ecommerce/Core/base_use_case/base_use_case.dart';
import 'package:route_ecommerce/Core/utils/errors/failure.dart';
import '../../data/model/product_model.dart';
import '../repo/product_repo.dart';

class ProductUseCase extends BaseUseCase<List<ProductModel>, NoParameters> {
  final ProductRepo productRepo;

  ProductUseCase({required this.productRepo});
  @override
  Future<Either<Failure, List<ProductModel>>> call(NoParameters parameters) async {
    return await productRepo.productData();
  }
}
