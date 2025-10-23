import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:route_ecommerce/Features/favorite/presentation/favorite_cubit/favorite_cubit.dart';
import 'package:route_ecommerce/Features/favorite/presentation/favorite_cubit/favorite_state.dart';
import 'package:shimmer/shimmer.dart';

import '../../../../product/presentation/view/product_details_screen.dart';
import '../../../../product/presentation/view_manager/product_cubit/product_cubit.dart';


class FavoriteItem extends StatelessWidget {
  const FavoriteItem({
    super.key,
    required this.id,
    required this.title,
    required this.image,
    required this.price,
    required this.rating,
    required this.description,
    required this.images,
  });

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
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => ProductDetailsScreen(productId: id)));
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
                  // ... (inside ProductItem widget)
                  Positioned(
                    top: 4.0,
                    right: 4.0,
                    child: BlocBuilder<FavoriteCubit, FavoriteState>(
                      builder: (context, state) {
                        final favoriteCubit =
                        FavoriteCubit.get(context);
                        final isCurrentlyFavorite =
                        favoriteCubit.isFavorite(id);

                        final iconData = isCurrentlyFavorite
                            ? Icons.favorite // Filled heart if favorited
                            : Icons.favorite_border;

                        final iconColor = isCurrentlyFavorite
                            ? Colors.red // Highlight color (changed from blue to red for clarity)
                            : Colors.blue;

                        return CircleAvatar(
                          backgroundColor: Colors.grey,
                          radius: 24,
                          child: IconButton(
                            onPressed: () {
                              favoriteCubit.toggleFavorite(productId: id);
                            },
                            // ✅ FIX: Use the calculated variables here
                            icon: Icon(
                              iconData,
                              color: iconColor, // Use the dynamic color
                              size: 28,
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                ],
              ),
              SizedBox(height: height * 0.01),
              Text(
                title,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: const TextStyle(
                    color: Colors.black,
                    fontSize: 18,
                    fontWeight: FontWeight.w500),
              ),
              SizedBox(height: height * 0.001),
              Text(
                description,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: const TextStyle(
                    color: Colors.grey,
                    fontSize: 15,
                    fontWeight: FontWeight.w500),
              ),
              SizedBox(height: height * 0.01),
              Text(
                "EGP ${price.toStringAsFixed(2) ?? "0.00"}",
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
                  Text(
                    "Review (${rating.toStringAsFixed(1)})",
                    style: const TextStyle(
                      color: Colors.black,
                      fontSize: 15,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  const Icon(
                    Icons.star,
                    size: 20,
                    color: Colors.yellow,
                  ),
                  CircleAvatar(
                    backgroundColor: const Color(0xff004182),
                    child: IconButton(
                      padding: EdgeInsets.zero,
                      constraints: const BoxConstraints(),
                      onPressed: () {
                        ProductCubit.get(context).addCart(productId: id);
                      },
                      icon: const Icon(
                        Icons.add,
                        size: 30,
                        color: Colors.white,
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
