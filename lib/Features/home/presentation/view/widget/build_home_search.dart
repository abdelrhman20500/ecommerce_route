import 'package:flutter/material.dart';
import 'package:route_ecommerce/Features/cart/presentation/view/cart_screen.dart';

import 'build_custom_search.dart';

class BuildHomeSearch extends StatelessWidget {
  const BuildHomeSearch({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const Expanded(child: BuildCustomSearch(name: "what do you search for?", iconData: Icons.search)),
        IconButton(onPressed: ()
        {
          Navigator.pushNamed(context, CartScreen.routeName);
        }, icon: const Icon(Icons.shopping_cart_outlined, size: 38,),
          color: Colors.blue,)
      ],
    );
  }
}
