import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:route_ecommerce/Features/home/data/repo/home_repo_impl.dart';
import 'package:route_ecommerce/Features/home/domain/use_case/category_use_case.dart';
import 'package:route_ecommerce/Features/home/presentation/view/widget/category_grid_view.dart';
import 'package:route_ecommerce/Features/home/presentation/view_manager/category_cubit.dart';
import '../../../../../Core/function/set_up_service_locator.dart';
import '../../view_manager/category_state.dart';

class CategoryBlocBuilder extends StatelessWidget {
  const CategoryBlocBuilder({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => CategoryCubit(
        // Inject HomeRepoImpl from getIt
        CategoryUseCase(getIt.get<HomeRepoImpl>()),
      )..categoryDate(),
      child: BlocBuilder<CategoryCubit, CategoryState>(
        builder: (context, state) {
          if (state is CategoryLoading) {
            return const Center(child: CircularProgressIndicator());
          } else if (state is CategorySuccess) {
            return CategoryGridView(model:state.categoryEntity);
          } else {
            return const Center(child: Text("No categories available"));
          }
        },
      ),
    );
  }
}