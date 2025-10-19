import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:route_ecommerce/Core/function/set_up_service_locator.dart';
import 'package:route_ecommerce/Features/product/presentation/view/widget/product_grid_view.dart';
import '../../../data/repo/product_repo_impl.dart';
import '../../../domain/use_case/add_cart_use_case.dart';
import '../../../domain/use_case/product_use_case.dart';
import '../../view_manager/product_cubit/product_cubit.dart';
import '../../view_manager/product_cubit/product_state.dart';

class ProductBlocBuilder extends StatelessWidget {
  const ProductBlocBuilder({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ProductCubit(
        ProductUseCase(productRepo: getIt.get<ProductRepoImpl>()),
        AddCartUseCase(productRepo: getIt.get<ProductRepoImpl>()),
      )..getProduct(),
      child: BlocBuilder<ProductCubit, ProductState>(
        builder: (context, state) {
          if (state is ProductLoading) {
            return const Center(child: CircularProgressIndicator());
          } else if (state is ProductSuccess) {
            return ProductGridView(model: state.productModel);
          } else if (state is AddCartLoading) {
            return Stack(
              children: [
                ProductGridView(model: state.currentProductModel ?? []),  // Assuming it's a list
                const Center(child: CircularProgressIndicator()),
              ],
            );
          } else if (state is AddCartSuccess) {
            // Show dialog for success
            WidgetsBinding.instance.addPostFrameCallback((_) {
              _showAddCartSuccessDialog(context);  // Call dialog function
            });
            return ProductGridView(model: state.currentProductModel ?? []);
          } else if (state is AddCartFailure) {
            // Optionally show an error dialog or message
            return ProductGridView(model: state.currentProductModel ?? []);
          } else {
            return Container();
          }
        },
      ),
    );
  }

  void _showAddCartSuccessDialog(BuildContext context) {
    showDialog(
      context: context,
      barrierDismissible: true,  // User can tap outside to dismiss
      builder: (context) {
        return AlertDialog(
          title: const Text('Success!'),
          content: const Text('Item added to cart successfully.'),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();  // Close the dialog
              },
              child: const Text('OK'),
            ),
          ],
        );
      },
    );
  }
}