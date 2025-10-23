import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:route_ecommerce/Core/utils/error_dialog.dart';
import 'package:route_ecommerce/Core/utils/loading_dialog.dart';
import 'package:route_ecommerce/Core/utils/success_dialog.dart';
import 'package:route_ecommerce/Core/widgets/custom_text_button.dart';
import 'package:route_ecommerce/Core/widgets/custom_text_field.dart';
import 'package:route_ecommerce/Features/Auth/data/repo/auth_repo_impl.dart';
import 'package:route_ecommerce/Features/Auth/domain/use_case/login_use_case.dart';
import 'package:route_ecommerce/Features/Auth/presentation/view/forget_password_screen.dart';
import 'package:route_ecommerce/Features/Auth/presentation/view/register_screen.dart';
import 'package:route_ecommerce/Features/Auth/presentation/view_manger/Login_cubit/login_cubit.dart';
import 'package:route_ecommerce/Features/Auth/presentation/view_manger/Login_cubit/login_state.dart';
import 'package:route_ecommerce/Features/layout/presentation/view/layout_screen.dart';

import '../../../../Core/function/set_up_service_locator.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({super.key});
  static String routeName = "LoginScreen";
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;

    return BlocProvider(
      create: (context) => LoginCubit(LoginUseCase(
        getIt.get<AuthRepoImpl>(),
      ),),
      child: BlocConsumer<LoginCubit, LoginState>(
        listener: (context, state) {
          if (state is LoginLoading) {
            showLoadingDialog(context);
          } else if (state is LoginFailure) {
            showErrorDialog(context, "try again Later!");
          } else if (state is LoginSuccess) {
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
                      SizedBox(height: height * 0.1),
                      Image.asset("assets/images/logo.png", height: 74, width: 200, fit: BoxFit.contain),
                      SizedBox(height: height * 0.05),
                      const Text(
                        "Welcome Back To Route",
                        style: TextStyle(color: Colors.white, fontSize: 22, fontWeight: FontWeight.w600),
                      ),
                      const Text(
                        "Please sign in with your mail",
                        style: TextStyle(fontSize: 18, color: Colors.white),
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
                      SizedBox(height: height * 0.04),
                      const Text(
                        "Password",
                        style: TextStyle(color: Colors.white, fontSize: 22, fontWeight: FontWeight.w600),
                      ),
                      SizedBox(height: height * 0.02),
                      CustomTextField(
                        hintText: "Enter Your Password",
                        controller: passwordController,
                        suffixIcon: const Icon(Icons.remove_red_eye_outlined, size: 32),
                      ),
                      SizedBox(height: height * 0.01),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          InkWell(
                            onTap: () {
                              Navigator.pushNamed(context, ForgetPasswordScreen.routeName);
                            },
                            child: const Text(
                              "Forget password",
                              style: TextStyle(color: Colors.white, fontSize: 20, fontWeight: FontWeight.w500),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: height * 0.08),
                      Container(
                        height: height * 0.07,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: Center(
                          child: CustomTextButton(
                            text: "Login",
                            onTab: () {
                              if (formKey.currentState!.validate()) {
                                BlocProvider.of<LoginCubit>(context).login(
                                  emailController.text,
                                  passwordController.text,
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
                            'Don’t have an account?',
                            style: TextStyle(fontSize: 18, color: Colors.white),
                          ),
                          SizedBox(width: width * 0.01),
                          InkWell(
                            onTap: () {
                              Navigator.pushNamed(context, RegisterScreen.routeName);
                            },
                            child: const Text(
                              'Create Account',
                              style: TextStyle(fontSize: 18, color: Colors.white),
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