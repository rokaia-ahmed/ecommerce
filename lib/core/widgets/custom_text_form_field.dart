import 'package:flutter/material.dart';

class CustomTextFormField extends StatelessWidget {
  const CustomTextFormField({super.key,
    required this.controller,
    this.onSubmitted, this.validator, this.fillColor,
    this.prefixIcon, this.hintText});

  final TextEditingController controller;
  final Color? fillColor;
  final String? hintText;
  final Widget? prefixIcon;
  final Function(String)? onSubmitted;
  final String? Function(String?)? validator;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 50,
      child: TextFormField(
        controller:controller ,
        cursorColor: Colors.black,
        onFieldSubmitted:onSubmitted ,
        validator: validator,
        decoration: InputDecoration(
          hintText: hintText,
          border: InputBorder.none,
          filled: true,
          fillColor:fillColor?? Colors.grey.shade300,
          enabledBorder:border,
          focusedBorder:border,
          prefixIcon: prefixIcon,
        ) ,
      ),
    );
  }
}

var border = OutlineInputBorder(
  borderRadius: BorderRadius.circular(10),
  borderSide: const BorderSide(
    width: 0,
    color: Colors.transparent,
  ),
) ;