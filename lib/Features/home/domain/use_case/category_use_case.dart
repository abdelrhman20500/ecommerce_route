import 'package:dartz/dartz.dart';
import '../../../../Core/base_use_case/base_use_case.dart';
import '../../../../Core/utils/errors/failure.dart';
import '../entity/category_entity.dart';
import '../repo/category_repo.dart';

class CategoryUseCase extends BaseUseCase<List<CategoryEntity>, NoParameters> {
  final HomeRepo homeRepo;

  CategoryUseCase(this.homeRepo);
  @override
  Future<Either<Failure, List<CategoryEntity>>> call(NoParameters parameters) async {
    return await homeRepo.categoryData();
  }
}