import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:route_ecommerce/Features/Auth/presentation/view/Login_screen.dart';
import 'package:route_ecommerce/Features/Auth/presentation/view/register_screen.dart';

import 'package:route_ecommerce/Features/cart/presentation/view/cart_screen.dart';
import 'package:route_ecommerce/Features/layout/presentation/view/layout_screen.dart';
import 'Core/function/api_service.dart';
import 'Core/function/set_up_service_locator.dart';
import 'Core/function/simple_bloc_observer.dart';
import 'Core/utils/shared_preferences.dart';
import 'Features/Splash/presentation/view/splash_screen.dart';
import 'Features/cart/data/data_source/cart_remote_data_source.dart';
import 'Features/cart/data/repo/cart_repo_impl.dart';
import 'Features/cart/domain/use_case/cart_user_use_case.dart';
import 'Features/cart/domain/use_case/delete_cart_use_case.dart';
import 'Features/cart/presentation/view_manger/cart_cubit/cart_cubit.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await SharedPref.init();
  setUpServiceLocator();
  Bloc.observer= SimpleBlocObserver();
  // CartCubit(CartUserUseCase(getIt.get<CartRepoImpl>(),),
  //   DeleteCartUseCase(cartRepo: CartRepoImpl(cartRemoteDataSource:
  //   CartRemoteDataSource(apiService: ApiService(Dio(),),),),),)..deleteItemCart(productId: "6428ebc6dc1175abc65ca0b9");
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: {
        SplashScreen.routeName:(_)=>const SplashScreen(),
        LoginScreen.routeName:(_)=>LoginScreen(),
        RegisterScreen.routeName:(_)=>RegisterScreen(),
        LayoutScreen.routeName:(_)=>LayoutScreen(),
        CartScreen.routeName:(_)=>const CartScreen(),
      },
      // initialRoute: CartScreen.routeName,
      initialRoute: SharedPref.getToken()== null ?LoginScreen.routeName: LayoutScreen.routeName,
    );
  }
}
