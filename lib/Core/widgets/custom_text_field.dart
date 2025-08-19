import 'package:flutter/material.dart';


class CustomTextField extends StatelessWidget {
  const CustomTextField({
    super.key, required this.hintText, this.suffixIcon, this.isSecure= false, this.keyboardType,this.controller
  });

  final String hintText;
  final TextInputType? keyboardType;
  final Widget? suffixIcon;
  final bool isSecure;
  final TextEditingController? controller;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      keyboardType: keyboardType,
      obscureText:isSecure,
      obscuringCharacter: "*",
      validator: (value){
        if(value ==null || value.isEmpty){
          return "This Field is Required";
        }
        return null;
      },
      decoration:InputDecoration(
        fillColor: Colors.white,
        filled: true,
        suffixIcon:suffixIcon,
        suffixStyle: const TextStyle(color: Colors.grey),
        hintText: hintText,
        hintStyle: const TextStyle(color: Colors.grey),
        border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
            borderSide: const BorderSide(
                width: 2,
                color:Colors.white
            )
        ),
        enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
            borderSide: const BorderSide(
                width: 2,
                color:Colors.white
            )
        ),
        focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
            borderSide: const BorderSide(
                width: 2,
                color:Colors.white
            ),
        ),
      ),
    );
  }
}
