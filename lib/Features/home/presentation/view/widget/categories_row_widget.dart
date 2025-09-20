import 'package:flutter/material.dart';

class CategoriesOrBrandsRowWidget extends StatelessWidget {
  const CategoriesOrBrandsRowWidget({super.key, required this.title,});

  final String title;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(title, style: const TextStyle(fontSize: 22, fontWeight: FontWeight.w600),),
        TextButton(onPressed: (){}, child: const Text("view all", style: TextStyle(
            fontSize: 18,  color: Colors.black),))
      ],
    );
  }
}
