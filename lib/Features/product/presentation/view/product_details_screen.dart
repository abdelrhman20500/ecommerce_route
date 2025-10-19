import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:route_ecommerce/Core/function/set_up_service_locator.dart';
import 'package:route_ecommerce/Features/product/presentation/view/widget/product_details_component.dart';
import '../../data/repo/product_repo_impl.dart';
import '../../domain/use_case/use_case_product_id.dart';
import '../view_manager/productId_cubit/product_id_cubit.dart';
import '../view_manager/productId_cubit/product_id_state.dart';

class ProductDetailsScreen extends StatelessWidget {
  const ProductDetailsScreen({super.key, required this.productId});

  static const String routeName = "ProductDetailsScreen";

  final String productId;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(Icons.arrow_back, color: Colors.blue),
        ),
        title: const Text(
          "Product Details",
          style: TextStyle(fontSize: 22, fontWeight: FontWeight.w500),
        ),
        centerTitle: true,
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.search, color: Colors.blue, size: 35),
          ),
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.shopping_cart_outlined, color: Colors.blue, size: 35),
          ),
        ],
      ),
      body: BlocProvider(
        create: (context) => ProductIdCubit(UseCaseProductId(getIt.get<ProductRepoImpl>())
        )..productIdDate(id: productId),
        child: BlocBuilder<ProductIdCubit, ProductIdState>(
          builder: (context, state) {
            if (state is ProductIdLoading) {
              return const Center(child: CircularProgressIndicator());
            } else if (state is ProductIdFailure) {
              return const Center(child: Text("No product details available"));
            } else if (state is ProductIdSuccess) {
              // print("66666");
              // print(state.productDetailsModel.data!.description);
              return ProductDetailsComponent(model: state.productDetailsModel);
            }
            return const SizedBox(); // fallback for ProductIdInitial or unknown state
          },
        ),
      ),
    );
  }
}