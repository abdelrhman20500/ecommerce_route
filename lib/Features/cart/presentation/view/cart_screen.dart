import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:route_ecommerce/Core/function/api_service.dart';
import 'package:route_ecommerce/Core/function/set_up_service_locator.dart';
import 'package:route_ecommerce/Features/cart/data/data_source/cart_remote_data_source.dart';
import 'package:route_ecommerce/Features/cart/data/repo/cart_repo_impl.dart';
import 'package:route_ecommerce/Features/cart/domain/use_case/cart_user_use_case.dart';
import 'package:route_ecommerce/Features/cart/domain/use_case/delete_cart_use_case.dart';
import 'package:route_ecommerce/Features/cart/domain/use_case/update_count_cart_use_case.dart';
import 'package:route_ecommerce/Features/cart/presentation/view/widget/cart_item.dart';
import 'package:route_ecommerce/Features/cart/presentation/view_manger/cart_cubit/cart_cubit.dart';
import 'package:route_ecommerce/Features/cart/presentation/view_manger/cart_cubit/cart_state.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  static const String routeName ="CartScreen";

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xff004182),
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(Icons.arrow_back, color: Colors.white, size: 32,),
        ),
        title: const Text(
          "Cart",
          style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold,color: Colors.white),
        ),
        centerTitle: true,
      ),
      body: BlocProvider(
        create: (context) => CartCubit(CartUserUseCase(getIt.get<CartRepoImpl>(),),
        DeleteCartUseCase(getIt.get<CartRepoImpl>()),
        UpdateCountCartUseCase(cartRepo: CartRepoImpl(cartRemoteDataSource: 
        CartRemoteDataSource(apiService: ApiService(Dio())))))..getCart(),
        child: BlocConsumer<CartCubit,CartState>(
          listener: (context, state) {
            if (state is DeleteItemFailure) {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text('Failed to delete item: ${state.errMessage}')),
              );
            }
          },
            builder: (context, state) {
              if(state is CartLoading || state is DeleteItemCartLoading){
                return const Center(child: CircularProgressIndicator(
                  color: Color(0xff004182),
                  ),
                );
              }else if(state is CartFailure){
                print("error :$state.errMessage");
              }else if(state is CartSuccess){
                return Column(
                  children: [
                    Expanded(
                      child: ListView.builder(
                          itemCount: state.cartModel.numOfCartItems,
                          itemBuilder: (context,index){
                            return CartItem(productsCart: state.cartModel.data!.products![index],);
                          }
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(12.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            children: [
                              const Text("Total price", style: TextStyle(
                                  fontSize: 22, fontWeight: FontWeight.bold, color: Colors.grey),),
                              Text("EGP {${state.cartModel.data?.totalCartPrice ?? "0.0"}}", style: const TextStyle(
                                  fontSize: 20, fontWeight: FontWeight.w600,color: Color(0xff004182)),),
                            ],
                          ),
                          Container(
                            height: height*0.06,
                            width: width*0.5,
                            decoration: BoxDecoration(
                                color: const Color(0xff004182),
                                borderRadius: BorderRadius.circular(22)
                            ),
                            child: Center(child: TextButton(onPressed: (){}, child: const Text("Check Out ->", style: TextStyle(
                                fontSize: 20, fontWeight: FontWeight.w600, color: Colors.white
                            ),))
                            ),
                          )
                        ],
                      ),
                    )
                  ],
                );
              }
              return const Center(child: Text("Cart is Empty", style: TextStyle(
                fontSize: 24, fontWeight: FontWeight.bold, color: Color(0xff004182),
              ),),);
            } ,
        )
      )
    );
  }
}

