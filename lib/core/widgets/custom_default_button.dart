import 'package:flutter/material.dart';
import '../utilites/colors.dart';

class CustomDefaultButton extends StatelessWidget {
   const CustomDefaultButton({super.key,
     required this.text,
     required this.onTap});
  final String text ;
  final Function() onTap ;
  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      onPressed:onTap,
      minWidth:double.infinity ,
      color: AppColors.primaryColor,
      height: 50,
      shape: OutlineInputBorder(
        borderRadius: BorderRadius.circular(20),
        borderSide: const BorderSide(
          width: 0,
          color: Colors.transparent,
        ),
      ),
      child:Text(text,
        style:Theme.of(context).textTheme.labelMedium,
      ) ,

    );
  }
}
