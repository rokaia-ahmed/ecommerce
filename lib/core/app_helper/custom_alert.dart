import 'package:ecommerce_app/core/utilites/colors.dart';
import 'package:ecommerce_app/core/utilites/media_query.dart';
import 'package:flutter/material.dart';

customAlert(context){
  showDialog(context: context,
      builder:(context) => Container(
        width: context.width,
        height: context.height,
        color:Colors.black12 ,
        child: const Center(
          child: CircularProgressIndicator(
            strokeCap:StrokeCap.butt ,
            color:AppColors.primaryColor ,
          ),
        ),
      ));
}