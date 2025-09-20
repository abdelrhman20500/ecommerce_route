import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:route_ecommerce/Core/function/set_up_service_locator.dart';
import 'package:route_ecommerce/Features/category/data/repo/product_repo_impl.dart';
import 'package:route_ecommerce/Features/category/domain/use_case/product_use_case.dart';
import 'package:route_ecommerce/Features/category/presentation/view/widget/product_grid_view.dart';
import '../../view_manager/product_cubit/product_cubit.dart';
import '../../view_manager/product_cubit/product_state.dart';

class ProductBlocBuilder extends StatelessWidget {
  const ProductBlocBuilder({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ProductCubit(ProductUseCase(productRepo:
      getIt.get<ProductRepoImpl>()))..getProduct(),
      child: BlocBuilder<ProductCubit,ProductState>(
        builder: (context, state) {
          if (state is ProductLoading) {
            return const Center(child: CircularProgressIndicator());
          } else if (state is ProductSuccess) {
            return ProductGridView(model: state.productModel);
          } else {
            return Container();
          }
        },
      ),
    );
  }
}
