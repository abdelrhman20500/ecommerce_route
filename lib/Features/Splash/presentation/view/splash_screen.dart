import 'package:flutter/material.dart';
import 'package:route_ecommerce/Features/Auth/presentation/view/Login_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});
  static String routeName = "SplashScreen";

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 3), () {
      Navigator.pushNamed(context, LoginScreen.routeName);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        constraints: const BoxConstraints.expand(
          height: double.infinity,
          width: double.infinity,
        ),
        decoration: const BoxDecoration(
          color: Colors.white, // Set a background color
        ),
        child: Image.asset(
          "assets/images/Splash Screen.png",
          fit: BoxFit.fill, // Use BoxFit.cover to maintain aspect ratio
        ),
      ),
    );
  }
}