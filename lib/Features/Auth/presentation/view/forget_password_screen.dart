import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:route_ecommerce/Core/function/api_service.dart';

import 'package:route_ecommerce/Core/widgets/custom_text_field.dart';
import 'package:route_ecommerce/Features/Auth/data/repo/auth_repo_impl.dart';
import 'package:route_ecommerce/Features/Auth/domain/use_case/forget_password_use_case.dart';
import 'package:route_ecommerce/Features/Auth/presentation/view/verify_reset_code_screen.dart';
import 'package:route_ecommerce/Features/Auth/presentation/view_manger/forget_password_cubit/forget_password_cubit.dart';
import 'package:route_ecommerce/Features/Auth/presentation/view_manger/forget_password_cubit/forget_password_state.dart';
import 'package:route_ecommerce/Features/Auth/presentation/view_manger/verify_reset_code_cubit/verify_reset_code_state.dart';

import '../../../../Core/utils/error_dialog.dart';
import '../../../../Core/utils/loading_dialog.dart';
import '../../../../Core/utils/success_dialog.dart';


class ForgetPasswordScreen extends StatelessWidget {
  ForgetPasswordScreen({super.key});

 static const String routeName ="ForgetPasswordScreen";

   TextEditingController emailController =TextEditingController();
   GlobalKey<FormState> formKey = GlobalKey<FormState>();


   @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocProvider(
        create: (context) => ForgetPasswordCubit(ForgetPasswordUseCase(
          AuthRepoImpl(apiService: ApiService(Dio(),),),
        )),
        child: BlocConsumer<ForgetPasswordCubit, ForgetPasswordState>(
          listener: (context, state) {
            if(state is ForgetPasswordLoading){
              showLoadingDialog(context);
            }else if(state is ForgetPasswordFailure){
              closeLoadingDialog(context);
              showErrorDialog(context, "Reset code failure");
            }else if(state is ForgetPasswordSuccess){
              closeLoadingDialog(context);
              showSuccessDialog(context, "Reset code Successfully");
              Navigator.pushNamed(context, VerifyResetCodeScreen.routeName);

            }
          },
          builder: (context, state) {
            return SingleChildScrollView(
              child: Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Form(
                    key: formKey,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        SizedBox(height: MediaQuery.of(context).size.height*0.1,),
                        const Align(
                          alignment: Alignment.center,
                          child: Text("Forget Password", style: TextStyle(fontSize: 22,fontWeight: FontWeight.bold,
                              color: Color(0xff004182)),),
                        ),
                        SizedBox(height: MediaQuery.of(context).size.height*0.1,),
                        const Text(
                          "Email address",style: TextStyle(fontSize: 22, color: Color(0xff004182)),),
                        const SizedBox(height: 16,),
                        CustomTextField(hintText: "Enter your Email",controller: emailController,
                          suffixIcon: const Icon(Icons.email),keyboardType: TextInputType.emailAddress,),
                        SizedBox(height: MediaQuery.of(context).size.height*0.025,),
                        Container(
                          height: MediaQuery.of(context).size.height*0.06,
                          decoration: BoxDecoration(
                            color: const Color(0xff004182),
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child: Center(child:TextButton(onPressed: ()
                          {
                            if(formKey.currentState!.validate()){
                              BlocProvider.of<ForgetPasswordCubit>(context).forgetPassword(emailController.text);
                            }
                          }, child: const Text("Verify Email", style: TextStyle(
                              color: Colors.white, fontSize: 22, fontWeight: FontWeight.w600
                          ),))
                          ),
                        ),
                        SizedBox(height: MediaQuery.of(context).size.height*0.025,),
                        InkWell(
                            onTap: (){},
                            child: const Text("Don’t get? send me new Email", style: TextStyle(color: Color(0xff004182)),)),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Text("Don't have an account ?"),
                            TextButton(onPressed: ()
                            {
                              // Navigator.pushNamed(context, SignUpScreen.routeName);
                            },
                                child: const Text("Sign Up", style: TextStyle(color: Color(0xff004182)),))
                          ],
                        )
                      ],
                    ),
                  )
              ),
            );
          },
        ),
      ),
    );
  }
}
