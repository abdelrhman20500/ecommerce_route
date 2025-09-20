import 'package:flutter/material.dart';
import 'package:route_ecommerce/Features/home/domain/entity/brands_entity.dart';
import 'package:route_ecommerce/Features/home/presentation/view/widget/brands_item.dart';


class BrandsGridView extends StatelessWidget {
  const BrandsGridView({super.key, required this.model,});

  final List<BrandsEntity> model;

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
          return BrandsItem(
            image: model[index].image,
            title: model[index].name,
          );
        },
      ),
    );
  }
}

