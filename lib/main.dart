import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:route_ecommerce/Core/function/api_service.dart';
import 'package:route_ecommerce/Features/Auth/presentation/view/Login_screen.dart';
import 'package:route_ecommerce/Features/Auth/presentation/view/change_password_screen.dart';
import 'package:route_ecommerce/Features/Auth/presentation/view/forget_password_screen.dart';
import 'package:route_ecommerce/Features/Auth/presentation/view/register_screen.dart';
import 'package:route_ecommerce/Features/Auth/presentation/view/verify_reset_code_screen.dart';
import 'package:route_ecommerce/Features/cart/presentation/view/cart_screen.dart';
import 'package:route_ecommerce/Features/favorite/data/data_source/favorite_remote_data_source.dart';
import 'package:route_ecommerce/Features/favorite/data/repo/fav_impl.dart';
import 'package:route_ecommerce/Features/favorite/domain/use_case/add_favorite_use_case.dart';
import 'package:route_ecommerce/Features/favorite/domain/use_case/get_favorite_use_case.dart';
import 'package:route_ecommerce/Features/favorite/domain/use_case/remove_favorite_use_case.dart';
import 'package:route_ecommerce/Features/favorite/presentation/favorite_cubit/favorite_cubit.dart';
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
    return BlocProvider(
      create: (context) => FavoriteCubit(
        AddFavoriteUseCase(
          favoriteRepo: FavoriteRepoImpl(
            favoriteRemoteDataSource: FavoriteRemoteDataSource(
              apiService: ApiService(Dio()),
            ),
          ),
        ),
        RemoveFavoriteUseCase(
          favoriteRepo: FavoriteRepoImpl(
            favoriteRemoteDataSource: FavoriteRemoteDataSource(
              apiService: ApiService(Dio()),
            ),
          ),
        ),
        GetFavoriteUseCase(
          favoriteRepo: FavoriteRepoImpl(
            favoriteRemoteDataSource: FavoriteRemoteDataSource(
              apiService: ApiService(Dio()),
            ),
          ),
        ),
      )..getFavorite(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        routes: {
          SplashScreen.routeName: (_) => const SplashScreen(),
          LoginScreen.routeName: (_) => LoginScreen(),
          RegisterScreen.routeName: (_) => RegisterScreen(),
          LayoutScreen.routeName: (_) => LayoutScreen(),
          CartScreen.routeName: (_) => const CartScreen(),
          ForgetPasswordScreen.routeName:(_)=>ForgetPasswordScreen(),
          VerifyResetCodeScreen.routeName:(_)=>const VerifyResetCodeScreen(),
          ChangePasswordScreen.routeName:(_)=>ChangePasswordScreen()
        },
        // initialRoute: LoginScreen.routeName,
        initialRoute: SharedPref.getToken() == null ? SplashScreen.routeName: LayoutScreen.routeName,
      ),
    );
  }
}
