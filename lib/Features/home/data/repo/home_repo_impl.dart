import 'package:dartz/dartz.dart';
import 'package:route_ecommerce/Core/utils/errors/failure.dart';
import 'package:route_ecommerce/Features/home/data/data_source/home_data_source.dart';
import 'package:route_ecommerce/Features/home/domain/entity/brands_entity.dart';
import 'package:route_ecommerce/Features/home/domain/repo/category_repo.dart';
import '../../../../Core/utils/errors/exception.dart';
import '../model/category_model.dart';

class HomeRepoImpl extends HomeRepo {
  final HomeBaseRemoteDataSource homeBaseRemoteDataSource;

  HomeRepoImpl({required this.homeBaseRemoteDataSource});
  @override
  Future<Either<Failure, List<CategoryModel>>> categoryData() async {
    try {
      final result = await homeBaseRemoteDataSource.getCategoryData();
      return right(result);
    } on ServerException catch (failure) {
      return Left(ServerFailure(failure.errorMessageModel.message));
    }
  }

  @override
  Future<Either<Failure, List<BrandsEntity>>> brandsData()async{
    try {
      final result = await homeBaseRemoteDataSource.getBrandsData();
      return right(result);
    } on ServerException catch (failure) {
      return Left(ServerFailure(failure.errorMessageModel.message));
    }
  }
}
