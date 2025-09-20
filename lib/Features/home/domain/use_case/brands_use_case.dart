import 'package:dartz/dartz.dart';
import 'package:route_ecommerce/Features/home/domain/entity/brands_entity.dart';
import '../../../../Core/base_use_case/base_use_case.dart';
import '../../../../Core/utils/errors/failure.dart';
import '../repo/category_repo.dart';

class BrandsUseCase extends BaseUseCase<List<BrandsEntity>, NoParameters> {
  final HomeRepo homeRepo;

  BrandsUseCase(this.homeRepo);
  @override
  Future<Either<Failure, List<BrandsEntity>>> call(NoParameters parameters) async {
    return await homeRepo.brandsData();
  }
}