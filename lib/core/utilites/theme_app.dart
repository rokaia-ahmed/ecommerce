import 'package:flutter/material.dart';

import 'colors.dart';

class AppTheme{

 static ThemeData lightTheme =ThemeData(
    textTheme: const TextTheme(
      headlineLarge:TextStyle(
        color: AppColors.primaryColor,
        fontWeight: FontWeight.w600,
        fontSize: 20,
      ) ,
      headlineMedium:TextStyle(
        color: Colors.black,
        fontWeight: FontWeight.bold,
        fontSize: 17,
      ),
      headlineSmall: TextStyle(
        color: AppColors.lightGreyColor,
        fontWeight: FontWeight.w400,
        fontSize: 15,
      ),
      bodyMedium:TextStyle(
        color: Colors.black,
        fontWeight: FontWeight.w500,
        fontSize: 16,
      ) ,
      labelMedium:TextStyle(color: Colors.white,
        fontSize: 18,
        fontWeight: FontWeight.w500,
      ) ,
    ) ,
  );
}