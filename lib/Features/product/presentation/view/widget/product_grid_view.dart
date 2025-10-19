import 'package:flutter/material.dart';
import 'package:route_ecommerce/Features/product/presentation/view/widget/product_item.dart';
import '../../../data/model/product_model.dart';


class ProductGridView extends StatelessWidget {
  const ProductGridView({super.key, required this.model,});

  final List<ProductModel> model;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 10.0, right: 10.0, top: 18.0),
      child: GridView.builder(
        itemCount: model.length,
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
            images: model[index].images,
          );
        },
      ),
    );
  }
}

