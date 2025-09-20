import 'package:flutter/material.dart';
import 'package:route_ecommerce/Features/home/presentation/view/widget/brands_bloc_builder.dart';
import 'package:route_ecommerce/Features/home/presentation/view/widget/build_carousel_slider.dart';
import 'package:route_ecommerce/Features/home/presentation/view/widget/build_home_search.dart';
import 'package:route_ecommerce/Features/home/presentation/view/widget/categories_row_widget.dart';
import 'package:route_ecommerce/Features/home/presentation/view/widget/category_bloc_builder.dart';

class HomeScreen extends StatelessWidget {
   const HomeScreen({super.key});


  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    // var width = MediaQuery.of(context).size.width;
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image(image: const AssetImage("assets/images/route.png",),
              height: height*0.03,fit: BoxFit.cover,),
            SizedBox(height: height*0.02,),
            const BuildHomeSearch(),
            SizedBox(height: height*0.02,),
            const BuildCarouselSlider(),
            SizedBox(height: height*0.02,),
            const CategoriesOrBrandsRowWidget(title: "Categories",),
            SizedBox(height: height*0.02,),
            const CategoryBlocBuilder(),
            SizedBox(height: height*0.01,),
            const CategoriesOrBrandsRowWidget(title: "Brands",),
            SizedBox(height: height*0.01,),
            const BrandsBlocBuilder()
          ],
        ),
      ),
    );
  }
}




