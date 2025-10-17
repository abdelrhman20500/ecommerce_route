import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class BrandsItem extends StatelessWidget {
  const BrandsItem({
    super.key,
    required this.image,
    required this.title,
  });

  final String image;
  final String title;

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;

    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        // Wrap with Container to add shadow
        Container(
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.25), // shadow color
                spreadRadius: 2,
                blurRadius: 8,
                offset: const Offset(0, 4), // shadow position
              ),
            ],
          ),
          child: CachedNetworkImage(
            imageUrl: image,
            imageBuilder: (context, imageProvider) => CircleAvatar(
              backgroundImage: imageProvider,
              radius: 44,
            ),
            placeholder: (context, url) => Shimmer.fromColors(
              baseColor: Colors.grey[300]!,
              highlightColor: Colors.grey[100]!,
              child: CircleAvatar(
                backgroundColor: Colors.grey[300],
                radius: 44,
              ),
            ),
            errorWidget: (context, url, error) => const CircleAvatar(
              radius: 44,
              child: Icon(
                Icons.error,
                color: Colors.red,
                size: 42,
              ),
            ),
          ),
        ),
        SizedBox(height: height * 0.01),
        Text(
          title,
          textAlign: TextAlign.center,
          style: const TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w600,
          ),
        ),
      ],
    );
  }
}