import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:route_ecommerce/Features/home/data/repo/home_repo_impl.dart';
import 'package:route_ecommerce/Features/home/domain/use_case/brands_use_case.dart';
import 'package:route_ecommerce/Features/home/presentation/view/widget/brands_grid_view.dart';
import 'package:route_ecommerce/Features/home/presentation/view/widget/category_grid_view.dart';
import 'package:route_ecommerce/Features/home/presentation/view_manager/brands_cubit/brands_cubit.dart';
import 'package:route_ecommerce/Features/home/presentation/view_manager/brands_cubit/brands_state.dart';
import '../../../../../Core/function/set_up_service_locator.dart';

class BrandsBlocBuilder extends StatelessWidget {
  const BrandsBlocBuilder({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => BrandsCubit(
       BrandsUseCase(getIt.get<HomeRepoImpl>())
      )..brandsData(),
      child: BlocBuilder<BrandsCubit, BrandsState>(
        builder: (context, state) {
          if (state is BrandsLoading) {
            return const Center(child: CircularProgressIndicator());
          } else if (state is BrandsSuccess) {
            return BrandsGridView(model:state.brandsEntity);
          } else {
            return const Center(child: Text("No Brands available"));
          }
        },
      ),
    );
  }
}