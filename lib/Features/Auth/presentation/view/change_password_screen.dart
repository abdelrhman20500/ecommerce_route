import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:route_ecommerce/Core/function/api_service.dart';
import 'package:route_ecommerce/Core/utils/error_dialog.dart';
import 'package:route_ecommerce/Core/utils/loading_dialog.dart';
import 'package:route_ecommerce/Core/utils/success_dialog.dart';
import 'package:route_ecommerce/Core/widgets/custom_text_field.dart';
import 'package:route_ecommerce/Features/Auth/data/repo/auth_repo_impl.dart';
import 'package:route_ecommerce/Features/Auth/domain/use_case/change_password_use_case.dart';
import 'package:route_ecommerce/Features/Auth/presentation/view/Login_screen.dart';
import 'package:route_ecommerce/Features/Auth/presentation/view_manger/change_password_cubit/change_password_cubit.dart';
import 'package:route_ecommerce/Features/Auth/presentation/view_manger/change_password_cubit/change_password_state.dart';

class ChangePasswordScreen extends StatelessWidget {
  ChangePasswordScreen({super.key});

  static const String routeName = "ChangePasswordScreen";

  final TextEditingController currentPasswordController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController rePasswordController = TextEditingController();
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          onPressed: () => Navigator.pop(context),
          icon: const Icon(Icons.arrow_back, color: Color(0xff004182)),
        ),
      ),
      body: BlocProvider(
        create: (context) => ChangePasswordCubit(
          ChangePasswordUseCase(
            authRepo: AuthRepoImpl(
              apiService: ApiService(Dio()),
            ),
          ),
        ),
        child: BlocConsumer<ChangePasswordCubit, ChangePasswordState>(
          listener: (context, state) {
            if (state is ChangePasswordLoading) {
              showLoadingDialog(context);
            } else if (state is ChangePasswordFailure) {
              closeLoadingDialog(context);
              showErrorDialog(context, state.errMessage);
            } else if (state is ChangePasswordSuccess) {
              closeLoadingDialog(context);
              showSuccessDialog(context, "Password changed successfully");
              Navigator.pushNamed(context, LoginScreen.routeName);
            }
          },
          builder: (context, state) {
            return Form(
              key: formKey,
              child: Padding(
                padding: const EdgeInsets.all(12),
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      SizedBox(height: height * 0.07),
                      const Align(
                        alignment: Alignment.center,
                        child: Text(
                          "New Password",
                          style: TextStyle(fontSize: 28, fontWeight: FontWeight.w600,color: Color(0xff004182)),
                        ),
                      ),
                      SizedBox(height: height * 0.05),
                      const Text("Current Password:", style: TextStyle(color: Color(0xff004182), fontSize: 20)),
                      SizedBox(height: height * 0.03),
                      CustomTextField(
                        hintText: "Current Password",
                        controller: currentPasswordController,
                        keyboardType: TextInputType.text,
                        suffixIcon: const Icon(Icons.remove_red_eye_outlined),
                      ),
                      const Text("Password:", style: TextStyle(color: Color(0xff004182), fontSize: 20)),
                      CustomTextField(
                        hintText: "Password",
                        controller: passwordController,
                        keyboardType: TextInputType.text,
                        suffixIcon: const Icon(Icons.remove_red_eye_outlined),
                      ),
                      SizedBox(height: height * 0.03),
                      const Text("re_Password:", style: TextStyle(color: Color(0xff004182), fontSize: 20)),
                      SizedBox(height: height * 0.03),
                      CustomTextField(
                        hintText: "re_Password",
                        controller: rePasswordController,
                        keyboardType: TextInputType.text,
                        suffixIcon: const Icon(Icons.remove_red_eye_outlined),
                      ),
                      SizedBox(height: height * 0.1),
                      Container(
                        height: height * 0.07,
                        width: double.infinity,
                        decoration: BoxDecoration(
                          color: const Color(0xff004182),
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: Center(
                          child: TextButton(onPressed: ()
                          {
                            if(formKey.currentState!.validate()){
                              BlocProvider.of<ChangePasswordCubit>(context).changePassword(
                                  currentPasswordController.text,
                                  passwordController.text,
                                  rePasswordController.text
                              );
                            }
                          },
                              child: const Text("Reset Password",style: TextStyle(
                                fontSize: 22, fontWeight: FontWeight.w600,color: Colors.white
                              ),))
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
