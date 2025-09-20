import 'package:flutter/material.dart';
import 'package:route_ecommerce/Features/category/presentation/view/widget/product_bloc_builder.dart';


class CategoryScreen extends StatelessWidget {
  const CategoryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // var height = MediaQuery.of(context).size.height;
    // var width = MediaQuery.of(context).size.width;
    return const ProductBlocBuilder();
  }
}

