import 'package:flutter/material.dart';
import 'package:route_ecommerce/Features/home/data/model/category_model.dart';

import 'category_item.dart';

class CategoryGridView extends StatelessWidget {
  const CategoryGridView({super.key, required this.model,});

  final List<CategoryModel> model;

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    return SizedBox(
      height: height*0.34,
      child: GridView.builder(
        itemCount: model.length,
        scrollDirection: Axis.horizontal,
        physics: const BouncingScrollPhysics(),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2, // 2 rows vertically
          mainAxisSpacing: 4.0,
          crossAxisSpacing: 4.0,
          childAspectRatio: 1.6 / 1.4,
        ),
        itemBuilder: (context, index) {
          return CategoryItem(
           image: model[index].image!,
            title: model[index].name!,
          );
        },
      ),
    );
  }
}

