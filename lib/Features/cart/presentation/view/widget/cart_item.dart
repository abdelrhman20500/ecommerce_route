import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:route_ecommerce/Features/cart/data/model/cart_model.dart';
import 'package:shimmer/shimmer.dart';

class CartItem extends StatelessWidget {
  const CartItem({super.key, required this.productsCart,});


  final GetProductsCart productsCart;

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          Container(
            decoration: BoxDecoration(
                border: Border.all(color: Colors.blue.withOpacity(0.4))
            ),
            child: Row(
              // mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  height: 140.0,
                  width: 150.0,
                  decoration: BoxDecoration(
                      color: Colors.grey[200], // 👈 Background color
                      borderRadius: BorderRadius.circular(4.0),
                      border: Border.all(color: Colors.blue.withOpacity(0.4))
                  ),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(12),
                    child: CachedNetworkImage(
                      imageUrl: productsCart.product!.imageCover!,
                      fit: BoxFit.fill,
                      height: height * 0.2, // Adjust height
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
                ),
                const SizedBox(width: 12.0,),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Expanded(
                            child: Text(productsCart.product!.title ?? "",maxLines: 2,overflow: TextOverflow.ellipsis,
                              style: const TextStyle(fontSize: 20, fontWeight: FontWeight.w600),),
                          ),
                          const SizedBox(width: 30.0,),
                          IconButton(onPressed: (){}, icon: const Icon(Icons.delete,
                            size:36, color: Color(0xff004182),)),
                        ],
                      ),
                      SizedBox(height: height*0.01,),
                      Text("Count >>  (${productsCart.count})",style: const TextStyle(fontSize: 18,
                      fontWeight: FontWeight.w600),),
                      SizedBox(height: height*0.01,),
                      Row(
                        children: [
                          Text("EGP ${productsCart.price!.toStringAsFixed(2) ?? "0.00"}", style: const TextStyle(
                              fontSize: 18, fontWeight: FontWeight.w600),),
                          const SizedBox(width: 20.0,),
                          Container(
                            width: width * 0.26,
                            height: height * 0.044,
                            decoration: BoxDecoration(
                              color: const Color(0xff004182),
                              borderRadius: BorderRadius.circular(22.0),
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Container(
                                  width: 28.0,
                                  height: 28.0,
                                  decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    border: Border.all(
                                      color: Colors.white,
                                      width: 2.0,
                                    ),
                                  ),
                                  child: InkWell(
                                    onTap: () {},
                                    child: const CircleAvatar(
                                      backgroundColor: Color(0xff004182),
                                      child: Icon(Icons.remove, color: Colors.white),
                                    ),
                                  ),
                                ),
                                 Text(productsCart.count.toString(),
                                  style: const TextStyle(
                                      color: Colors.white,
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold),
                                ),
                                Container(
                                  width: 28.0,
                                  height: 28.0,
                                  decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    border: Border.all(
                                      color: Colors.white,
                                      width: 2.0,
                                    ),
                                  ),
                                  child: InkWell(
                                    onTap: () {},
                                    child: const CircleAvatar(
                                      backgroundColor: Color(0xff004182),
                                      child: Icon(Icons.add, color: Colors.white),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
