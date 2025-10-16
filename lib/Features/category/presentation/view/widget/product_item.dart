import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:route_ecommerce/Features/category/presentation/view/product_details_screen.dart';
import 'package:shimmer/shimmer.dart';


class ProductItem extends StatelessWidget {
  const ProductItem({super.key, required this.id, required this.title, required this.image, required this.price, required this.rating, required this.description, required this.images,});


  final String id;
  final String title;
  final String description;
  final String image;
  final int price;
  final double rating;
  final List<String>? images;



  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    return InkWell(
      onTap: () {
       Navigator.push(context, MaterialPageRoute(builder: (context)=>ProductDetailsScreen(productId: id)));
      },
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(18),
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.5), // Shadow color
              spreadRadius: 1, // Spread of the shadow
              blurRadius: 5, // Softness of the shadow
              offset: const Offset(2, 2), // Shadow position
            ),
          ],
        ),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Stack(
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(12),
                    child: CachedNetworkImage(
                      imageUrl: image,
                      fit: BoxFit.fill,
                      height: height * 0.17, // Adjust height
                      width: double.infinity, // Full width
                      placeholder: (context, url) => Shimmer.fromColors(
                        baseColor: Colors.grey[700]!,
                        highlightColor: Colors.grey[500]!,
                        child: Container(
                          height: height * 0.2,
                          width: double.infinity,
                          color: Colors.grey,
                        ),
                      ),
                      errorWidget: (context, url, error) =>
                      const Icon(Icons.error),
                    ),
                  ),
                  Positioned(
                    top: 4.0,
                    right: 4.0,
                    child: CircleAvatar(
                      backgroundColor:
                      Colors.white, // 🔵 Your custom color
                      radius: 24, // You can adjust size as needed
                      child: IconButton(
                        onPressed: () {},
                        icon: const Icon(
                          Icons.favorite_border,
                          color: Colors.blue,
                          size: 28,
                        ), // Contrast color
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: height * 0.01),
              Text(title, maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: const TextStyle(
                    color: Colors.black,fontSize: 18,fontWeight: FontWeight.w500),),
              SizedBox(height: height * 0.001),
              Text(description,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: const TextStyle(
                    color: Colors.grey, fontSize: 15, fontWeight: FontWeight.w500),),
              SizedBox(height: height * 0.01),
              Text("EGP ${price.toStringAsFixed(2) ?? "0.00"}",
                style: const TextStyle(
                  color: Colors.black,
                  fontSize: 18,
                  fontWeight: FontWeight.w500,
                ),
              ),
              SizedBox(height: height * 0.001),

              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("Review (${rating.toStringAsFixed(1)})",
                    style: const TextStyle(
                      color: Colors.black,
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  const Icon(Icons.star, color: Colors.yellow,),
                  CircleAvatar(
                    backgroundColor: Colors.blue,
                    child: IconButton(
                      padding: EdgeInsets.zero,
                      constraints: const BoxConstraints(),
                      onPressed: () {},
                      icon: const Icon(
                        Icons.add,
                        size: 30,
                        color: Colors.black,
                      ),
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
