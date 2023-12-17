import 'package:ecommerce_app/core/utilites/colors.dart';
import 'package:flutter/material.dart';

class CustomTextFormField extends StatelessWidget {
  const CustomTextFormField({super.key,
    required this.controller,
    this.onSubmitted, this.validator, this.fillColor,
    this.prefixIcon, this.hintText, this.labelText, this.obscureText});

  final TextEditingController controller;
  final Color? fillColor;
  final String? hintText;
  final String? labelText;
  final Widget? prefixIcon;
  final bool? obscureText;
  final Function(String)? onSubmitted;
  final String? Function(String?)? validator;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller:controller ,
      cursorColor: Colors.black,
      obscureText:obscureText??false ,
      onFieldSubmitted:onSubmitted ,
      validator: validator,
      style:Theme.of(context).textTheme.headlineMedium ,
      decoration: InputDecoration(
        isDense:true ,
        hintText: hintText,
        labelText:labelText ,
        prefixIconColor:Colors.grey.shade600,
        prefixIconConstraints:const BoxConstraints(
          minWidth: 30,
        ) ,
        labelStyle:Theme.of(context).textTheme.headlineSmall ,
        prefixIcon: prefixIcon,
        focusedBorder: border ,
      ) ,
    );
  }
}

var border = UnderlineInputBorder(
  borderSide: BorderSide(
    color: AppColors.lightGreyColor,
  ),
);