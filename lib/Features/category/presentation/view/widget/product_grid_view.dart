import 'package:flutter/material.dart';
import 'package:route_ecommerce/Features/category/data/model/product_model.dart';
import 'package:route_ecommerce/Features/category/presentation/view/widget/product_item.dart';


class ProductGridView extends StatelessWidget {
  const ProductGridView({super.key, required this.model,});

  final List<ProductModel> model;

  @override
  Widget build(BuildContext context) {
    // var height = MediaQuery.of(context).size.height;
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: GridView.builder(
        itemCount: 8,
        scrollDirection: Axis.vertical,
        physics: const BouncingScrollPhysics(),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2, // 2 rows vertically
          mainAxisSpacing: 12.0,
          crossAxisSpacing: 12.0,
          childAspectRatio: 1.4 / 2.2,
        ),
        itemBuilder: (context, index) {
          return ProductItem(
            id: model[index].id!,
            title: model[index].title!,
            image: model[index].imageCover!,
            price: model[index].price!,
            description: model[index].description!,
            rating: model[index].ratingsAverage!,
          );
        },
      ),
    );
  }
}

