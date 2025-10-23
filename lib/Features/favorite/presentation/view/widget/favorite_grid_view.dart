import 'package:flutter/material.dart';
import 'package:route_ecommerce/Features/favorite/data/model/favorite_model.dart';
import 'package:route_ecommerce/Features/product/presentation/view/widget/product_item.dart';

import 'favorite_item.dart';


class FavoriteGridView extends StatelessWidget {
  const FavoriteGridView({super.key, required this.model,});

  final FavoriteModel model;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 10.0, right: 10.0, top: 18.0),
      child: GridView.builder(
        itemCount: model.data!.length,
        scrollDirection: Axis.vertical,
        physics: const BouncingScrollPhysics(),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2, // 2 rows vertically
          mainAxisSpacing: 12.0,
          crossAxisSpacing: 12.0,
          childAspectRatio: 1.3 / 2.2,
        ),
        itemBuilder: (context, index) {
          return FavoriteItem(
            id: model.data![index].id!,
            title: model.data![index].title!,
            image: model.data![index].imageCover!,
            price: model.data![index].price!,
            description: model.data![index].description!,
            rating: model.data![index].ratingsAverage!,
            images: model.data![index].images,
          );
        },
      ),
    );
  }
}

