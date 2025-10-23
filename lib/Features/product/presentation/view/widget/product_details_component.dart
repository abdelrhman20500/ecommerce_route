import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:readmore/readmore.dart';
import 'package:shimmer/shimmer.dart';
import '../../../data/model/product_details_model.dart';

class ProductDetailsComponent extends StatelessWidget {
  const ProductDetailsComponent({
    super.key,
    required this.model,
  });

  final ProductDetailsModel model;

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(12),
                  child: CarouselSlider(
                    options: CarouselOptions(
                      height: height * 0.3,
                      enlargeCenterPage: true,
                      enableInfiniteScroll: true,
                      autoPlay: true,
                    ),
                    items: model.data?.images?.map((imageUrl) {
                          return Builder(
                            builder: (BuildContext context) {
                              return Container(
                                decoration: BoxDecoration(
                                  boxShadow: [
                                    BoxShadow(
                                      color: Colors.black.withOpacity(0.25),
                                      blurRadius: 12,
                                      offset: const Offset(0, 6),
                                    ),
                                  ],
                                  borderRadius: BorderRadius.circular(12),
                                ),
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(12),
                                  child: CachedNetworkImage(
                                    imageUrl: imageUrl,
                                    fit: BoxFit.fill,
                                    height: height * 0.2,
                                    width: double.infinity,
                                    placeholder: (context, url) =>
                                        Shimmer.fromColors(
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
                              );
                            },
                          );
                        }).toList() ??
                        [],
                  ),
                ),
              ],
            ),
            SizedBox(
              height: height * 0.03,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: Text(
                    model.data!.title ?? "",
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: const TextStyle(
                        color: Colors.black,
                        fontSize: 22,
                        fontWeight: FontWeight.w600),
                  ),
                ),
                Text(
                  "EGP ${model.data?.price?.toStringAsFixed(2) ?? "0.00"}",
                  style: const TextStyle(
                    color: Colors.black,
                    fontSize: 22,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ],
            ),
            SizedBox(
              height: height * 0.03,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Container(
                    width: width * 0.3, // Width of the rectangle
                    height: height * 0.05, // Height of the rectangle
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: Colors.blue, // Border color
                        width: 2.0, // Border width
                      ),
                      borderRadius: BorderRadius.circular(
                          22.0), // Optional: Rounded corners
                    ), // Center the text inside the rectangle
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        const Text(
                          "Sold :",
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 17,
                              fontWeight: FontWeight.w600),
                        ),
                        Text(
                          model.data?.sold.toString() ?? "",
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: const TextStyle(
                              color: Colors.black,
                              fontSize: 17,
                              fontWeight: FontWeight.w600),
                        ),
                      ],
                    )),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Icon(
                      Icons.star,
                      color: Colors.yellow,
                    ),
                    Text(
                      model.data!.ratingsAverage.toString(),
                      style: const TextStyle(
                          color: Colors.black,
                          fontSize: 17,
                          fontWeight: FontWeight.w600),
                    ),
                    Text(
                      "(${model.data!.ratingsQuantity.toString()})",
                      style: const TextStyle(
                          color: Colors.black,
                          fontSize: 17,
                          fontWeight: FontWeight.w600),
                    ),
                  ],
                ),
                Container(
                    width: width * 0.4,
                    height: height * 0.05,
                    decoration: BoxDecoration(
                      color: const Color(0xff004182),
                      borderRadius: BorderRadius.circular(22.0),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Container(
                          width: 34.0,
                          height: 34.0,
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
                        const Text(
                          "1",
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 18,
                              fontWeight: FontWeight.bold),
                        ),
                        Container(
                          width: 34.0,
                          height: 34.0,
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
            SizedBox(
              height: height * 0.03,
            ),
            const Text(
              "Description",
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),
            ReadMoreText(model.data!.description ?? "",
              style: const TextStyle(fontSize: 18, fontWeight: FontWeight.w500, color: Colors.grey),
              trimMode: TrimMode.Line,
              trimLines: 2,
              colorClickableText: Colors.pink,
              trimCollapsedText: 'Show more',
              trimExpandedText: 'Show less',
              moreStyle: const TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
            ),
            SizedBox(
              height: height * 0.1,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      "Total Price",
                      style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w600,
                          color: Colors.grey),
                    ),
                    Text(
                      "EGP ${model.data?.price?.toStringAsFixed(2) ?? "0.00"}",
                      style: const TextStyle(
                        color: Colors.black,
                        fontSize: 22,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ],
                ),
                InkWell(
                  onTap: (){},
                  child: Container(
                    height: height * 0.06,
                    width: width * 0.54,
                    decoration: BoxDecoration(
                        color: const Color(0xff004182),
                        borderRadius: BorderRadius.circular(22)),
                    child: const Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Icon(
                          Icons.shopping_cart_outlined,
                          size: 34,
                          color: Colors.white,
                        ),
                        Text(
                          "Add To Cart",
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 22,
                              fontWeight: FontWeight.w600),
                        )
                      ],
                    ),
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
