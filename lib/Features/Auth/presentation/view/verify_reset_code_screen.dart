import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';
import 'package:route_ecommerce/Core/function/api_service.dart';
import 'package:route_ecommerce/Features/Auth/data/repo/auth_repo_impl.dart';
import 'package:route_ecommerce/Features/Auth/domain/use_case/verify_reset_code_use_case.dart';
import 'package:route_ecommerce/Features/Auth/presentation/view/change_password_screen.dart';
import 'package:route_ecommerce/Features/Auth/presentation/view_manger/verify_reset_code_cubit/verify_reset_code_cubit.dart';
import 'package:route_ecommerce/Features/Auth/presentation/view_manger/verify_reset_code_cubit/verify_reset_code_state.dart';
import '../../../../Core/utils/error_dialog.dart';
import '../../../../Core/utils/loading_dialog.dart';
import '../../../../Core/utils/success_dialog.dart';

class VerifyResetCodeScreen extends StatelessWidget {
  const VerifyResetCodeScreen({super.key});

  static const String routeName ="VerifyResetCodeScreen";

  @override
  Widget build(BuildContext context) {
    // final String email = ModalRoute.of(context)!.settings.arguments as String;
    var height= MediaQuery.of(context).size.height;
    return BlocProvider(
      create: (context) => VerifyResetCodeCubit(VerifyResetCodeUseCase(AuthRepoImpl(apiService:
      ApiService(Dio())))),
      child: BlocConsumer<VerifyResetCodeCubit, VerifyResetCodeState>(
        listener: (context, state) {
          if(state is VerifyResetCodeLoading){
            // You can show a loading indicator or message here
            showLoadingDialog(context);
          }else if(state is VerifyResetCodeFailure){
            closeLoadingDialog(context);
            showErrorDialog(context, "please try again later !");
          }else if(state is VerifyResetCodeSuccess){
            closeLoadingDialog(context);
            showSuccessDialog(context, "Code is Successfully");
            Navigator.pushNamed(context, ChangePasswordScreen.routeName);
          }
        },
        builder: (context, state) {
          return Scaffold(
            appBar: AppBar(
              backgroundColor: Colors.transparent,
              elevation: 0,
              leading: IconButton(onPressed: (){
                Navigator.pop(context);
              }, icon: const Icon(Icons.arrow_back, color:Color(0xff004182),)),
            ),
            body: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(12.0),
                child: Column(
                  children: [
                    SizedBox(height: height*0.1,),
                    const Text("Verification Code", style: TextStyle(
                        color: Color(0xff004182),fontSize: 28, fontWeight: FontWeight.w600),),
                    SizedBox(height: height*0.04,),
                    OtpTextField(
                      fieldWidth: 46.0,
                      numberOfFields: 6,

                      borderColor: const Color(0xff004182),
                      //set to true to show as box or false to show as dash
                      showFieldAsBox: true,
                      //runs when a code is typed in
                      onCodeChanged: (String code) {
                        //handle validation or checks here
                      },
                      //runs when every text-field is filled
                      onSubmit: (String verificationCode){
                        BlocProvider.of<VerifyResetCodeCubit>(context).verifyCode(
                            verificationCode,
                        );
                      }, // end onSubmit
                    ),
                    SizedBox(height: height*0.04,),
                    Container(
                      height: MediaQuery.of(context).size.height*0.06,
                      decoration: BoxDecoration(
                        color: const Color(0xff004182),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Center(child:TextButton(onPressed: (){}, child: const Text("Verify Pin", style: TextStyle(
                          color: Colors.white, fontSize: 22, fontWeight: FontWeight.w600
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
    );
  }
}
