import 'package:flutter/material.dart';

class CategoriesRowWidget extends StatelessWidget {
  const CategoriesRowWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        const Text("Categories", style: TextStyle(fontSize: 22, fontWeight: FontWeight.w600),),
        TextButton(onPressed: (){}, child: const Text("view all", style: TextStyle(
            fontSize: 18,  color: Colors.black),))
      ],
    );
  }
}
