import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:route_ecommerce/Features/Auth/presentation/view/Login_screen.dart';
import 'package:route_ecommerce/Features/Auth/presentation/view/register_screen.dart';
import 'package:route_ecommerce/Features/layout/presentation/view/layout_screen.dart';
import 'Core/function/set_up_service_locator.dart';
import 'Core/function/simple_bloc_observer.dart';
import 'Core/utils/shared_preferences.dart';
import 'Features/Splash/presentation/view/splash_screen.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await SharedPref.init();
  setUpServiceLocator();
  Bloc.observer= SimpleBlocObserver();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      // home: LoginScreen(),
      routes: {
        SplashScreen.routeName:(_)=>const SplashScreen(),
        LoginScreen.routeName:(_)=>LoginScreen(),
        RegisterScreen.routeName:(_)=>RegisterScreen(),
        LayoutScreen.routeName:(_)=>LayoutScreen(),
      },
      // initialRoute: RegisterScreen.routeName,
      initialRoute: SharedPref.getToken()== null ?LoginScreen.routeName: LayoutScreen.routeName,
    );
  }
}
