import '../../../domain/entity/brands_entity.dart';

abstract class BrandsState{}
class BrandsInitial extends BrandsState{}
class BrandsLoading extends BrandsState{}
class BrandsFailure extends BrandsState{
  final String errMessage;
  BrandsFailure({required this.errMessage});
}
class BrandsSuccess extends BrandsState{
  final List<BrandsEntity> brandsEntity;
  BrandsSuccess({required this.brandsEntity});
}
