import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:route_ecommerce/Features/cart/presentation/view/cart_screen.dart';
import 'package:route_ecommerce/Features/favorite/presentation/view/favorite_screen.dart';
import 'package:route_ecommerce/Features/home/presentation/view/home_screen.dart';
import 'package:route_ecommerce/Features/profile/presentation/view/profile_screen.dart';
import '../view_manager/nav_bar_cubit.dart';
import '../view_manager/nav_bar_state.dart';

class LayoutScreen extends StatelessWidget {
   LayoutScreen({super.key});
  static const String routeName ="LayoutScreen";
  final List<Widget> tabs=[
    const HomeScreen(),
    const CartScreen(),
    const FavoriteScreen(),
    const ProfileScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => NavBarCubit(),
      child: BlocBuilder<NavBarCubit, NavBarState>(
        builder: (context, state) {
          var cubit = BlocProvider.of<NavBarCubit>(context);
          return Scaffold(
            body: SafeArea(
                child: tabs[cubit.currentIndex]
            ),
            bottomNavigationBar: Container(
              decoration: const BoxDecoration(
                  color: Colors.white
              ),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 10.0),
                child: GNav(
                    onTabChange: (index) {
                      cubit.changeIndex(index); // Update the index here
                    },
                    rippleColor:Colors.blue, // tab button ripple color when pressed
                    hoverColor: Colors.blue, // tab button hover color
                    haptic: true, // haptic feedback
                    tabBorderRadius: 15,
                    duration: const Duration(milliseconds: 180), // tab animation duration
                    gap: 8, // the tab button gap between icon and text
                    color: Colors.grey, // unselected icon color
                    activeColor: Colors.white, // selected icon and text color
                    iconSize: 28, // tab button icon size
                    tabBackgroundColor:Colors.blue, // selected tab background color
                    padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12), // navigation bar padding
                    tabs: const[
                      GButton(icon: Icons.home, text: 'Home',),
                      GButton(icon: Icons.category_sharp, text: 'Category',),
                      GButton(icon: Icons.favorite, text: 'Favorite',),
                      GButton(icon: Icons.person, text: 'Profile',),
                    ]
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
