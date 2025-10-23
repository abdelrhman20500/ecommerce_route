import 'package:flutter/material.dart';
import 'package:route_ecommerce/Core/utils/shared_preferences.dart';
import 'package:route_ecommerce/Features/Auth/presentation/view/Login_screen.dart';
import 'package:route_ecommerce/Features/profile/presentation/view/widget/build_row_item_profile.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.asset("assets/images/route.png", fit: BoxFit.fill,),
            SizedBox(height: height*0.01,),
            const Text("Welcome, Mohamed", style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),),
            const Text("mohamed.N@gmail.com", style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500,
            color: Colors.grey),),
            SizedBox(height: height*0.02,),
            const Text("Your Full name", style: TextStyle(
                color: Color(0xff004182),fontSize: 20, fontWeight: FontWeight.w600),),
            SizedBox(height: height*0.01,),
            const BuildRowItemProfile(title: "Name",icon: Icons.edit,),
            SizedBox(height: height*0.03,),
            const Text("Your E-mail", style: TextStyle(
                color: Color(0xff004182), fontSize: 20, fontWeight: FontWeight.w600),),
            SizedBox(height: height*0.01,),
            const BuildRowItemProfile(title: "Email",icon: Icons.edit,),
            SizedBox(height: height*0.03,),
            const Text("Your password", style: TextStyle(
                color: Color(0xff004182), fontSize: 20, fontWeight: FontWeight.w600),),
            SizedBox(height: height*0.01,),
            const BuildRowItemProfile(title: "Password",icon: Icons.edit,),
            SizedBox(height: height*0.03,),
            const Text("Your mobile number", style: TextStyle(
                color: Color(0xff004182), fontSize: 20, fontWeight: FontWeight.w600),),
            SizedBox(height: height*0.01,),
            const BuildRowItemProfile(title: "mobile",icon: Icons.edit,),
            SizedBox(height: height*0.03,),
            const Text("Your Address", style: TextStyle(
                color: Color(0xff004182), fontSize: 20, fontWeight: FontWeight.w600),),
            SizedBox(height: height*0.01,),
            const BuildRowItemProfile(title: "address",icon: Icons.edit,),
            SizedBox(height: height*0.04,),
            InkWell(
              onTap: ()
              {
                SharedPref.removeToken();
                Navigator.pushNamed(context, LoginScreen.routeName);
              },
              child: Container(
                height: 62,
                decoration: BoxDecoration(
                  color: const Color(0xff004182),
                    borderRadius: BorderRadius.circular(16),
                    border: Border.all(
                      color: Colors.grey,
                    )
                ),
                child: const Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Icon(Icons.logout, size: 38,color: Colors.white,),
                    Text("Logout", style: TextStyle(
                        color: Colors.white, fontSize: 24, fontWeight: FontWeight.w600),),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
