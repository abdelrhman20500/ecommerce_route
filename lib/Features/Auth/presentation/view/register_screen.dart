import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:route_ecommerce/Core/utils/error_dialog.dart';
import 'package:route_ecommerce/Core/utils/loading_dialog.dart';
import 'package:route_ecommerce/Core/utils/success_dialog.dart';
import 'package:route_ecommerce/Features/Auth/data/repo/auth_repo_impl.dart';
import 'package:route_ecommerce/Features/Auth/domain/use_case/register_use_case.dart';
import 'package:route_ecommerce/Features/Auth/presentation/view/Login_screen.dart';
import 'package:route_ecommerce/Features/Auth/presentation/view_manger/Register_cubit/register_cubit.dart';
import 'package:route_ecommerce/Features/Auth/presentation/view_manger/Register_cubit/register_state.dart';
import 'package:route_ecommerce/Features/layout/presentation/view/layout_screen.dart';
import '../../../../Core/function/set_up_service_locator.dart';
import '../../../../Core/widgets/custom_text_button.dart';
import '../../../../Core/widgets/custom_text_field.dart';

class RegisterScreen extends StatelessWidget {
   RegisterScreen({super.key});
  static String routeName = "RegisterScreen";
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
   final nameController = TextEditingController();
   final rePasswordController = TextEditingController();
   final phoneController = TextEditingController();
   GlobalKey<FormState> formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return BlocProvider(
      create: (context) => RegisterCubit(RegisterUseCase(
        getIt.get<AuthRepoImpl>(), // get AuthRepoImpl from getI
      ),),
      child: BlocConsumer<RegisterCubit, RegisterState>(
        listener: (context, state) {
          if(state is RegisterLoading){
            showLoadingDialog(context);
          }else if(state is RegisterFailure){
            showErrorDialog(context, "try again Later!");
          }else if(state is RegisterSuccess){
            closeLoadingDialog(context);
            showSuccessDialog(context, state.authModel.message!);
            Navigator.pushNamed(context, LayoutScreen.routeName);
          }
        },
        builder: (context, state) {
          return Scaffold(
            backgroundColor: const Color(0xff004182),
            body: Padding(
              padding: const EdgeInsets.all(16.0),
              child: SingleChildScrollView(
                child: Form(
                  key: formKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      SizedBox(height: height * 0.08),
                      Image.asset("assets/images/logo.png", height: 74, width: 200, fit: BoxFit.contain),
                      SizedBox(height: height * 0.02),
                      const Text(
                        "Full Name",
                        style: TextStyle(color: Colors.white, fontSize: 22, fontWeight: FontWeight.w600),
                      ),
                      SizedBox(height: height * 0.02),
                      CustomTextField(
                        hintText: "Enter Your Full Name",
                        controller: nameController,
                        suffixIcon: const Icon(Icons.person, size: 32),
                      ),
                      SizedBox(height: height * 0.02),
                      const Text(
                        "Phone",
                        style: TextStyle(color: Colors.white, fontSize: 22, fontWeight: FontWeight.w600),
                      ),
                      SizedBox(height: height * 0.02),
                      CustomTextField(
                        hintText: "Enter Your Phone",
                        controller: phoneController,
                        suffixIcon: const Icon(Icons.phone, size: 32),
                      ),
                      SizedBox(height: height * 0.02),
                      const Text(
                        "Email",
                        style: TextStyle(color: Colors.white, fontSize: 22, fontWeight: FontWeight.w600),
                      ),
                      SizedBox(height: height * 0.02),
                      CustomTextField(
                        hintText: "Enter Your Email",
                        controller: emailController,
                        suffixIcon: const Icon(Icons.email_outlined, size: 32),
                      ),
                      SizedBox(height: height * 0.02),
                      const Text(
                        "Password",
                        style: TextStyle(color: Colors.white, fontSize: 22, fontWeight: FontWeight.w600),
                      ),
                      SizedBox(height: height * 0.02),
                      CustomTextField(
                        hintText: "Enter Your Password",
                        controller: rePasswordController,
                        suffixIcon: const Icon(Icons.remove_red_eye_outlined, size: 32),
                      ),
                      SizedBox(height: height * 0.02),
                      const Text(
                        "rePassword",
                        style: TextStyle(color: Colors.white, fontSize: 22, fontWeight: FontWeight.w600),
                      ),
                      SizedBox(height: height * 0.02),
                      CustomTextField(
                        hintText: "Enter Your rePassword",
                        controller: passwordController,
                        suffixIcon: const Icon(Icons.remove_red_eye_outlined, size: 32),
                      ),
                      SizedBox(height: height * 0.05),
                      Container(
                        height: height * 0.07,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: Center(
                          child: CustomTextButton(
                            text: "Sign Up",
                            onTab: () {
                              if (formKey.currentState!.validate()) {
                                BlocProvider.of<RegisterCubit>(context).register(
                                    emailController.text,
                                    passwordController.text,
                                    nameController.text,
                                    rePasswordController.text,
                                    phoneController.text,
                                );
                              }
                            },
                          ),
                        ),
                      ),
                      SizedBox(height: height * 0.03),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Text(
                            'Already have an account?',
                            style: TextStyle(fontSize: 18, color: Colors.white),
                          ),
                          SizedBox(width: width * 0.01),
                          InkWell(
                            onTap: () {
                              Navigator.pushNamed(context, LoginScreen.routeName);
                            },
                            child: const Text(
                              'Login',
                              style: TextStyle(fontSize: 20, color: Colors.white),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
