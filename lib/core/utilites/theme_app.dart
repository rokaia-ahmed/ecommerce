import 'package:flutter/material.dart';

import 'colors.dart';

class AppTheme{

 static ThemeData lightTheme =ThemeData(
  // useMaterial3: false,
    textTheme:  TextTheme(
      headlineLarge:const TextStyle(
        color: AppColors.textColor,
        fontWeight: FontWeight.w600,
        fontSize: 30,
      ) ,
      headlineMedium:const TextStyle(
        color: AppColors.textColor,
        fontWeight: FontWeight.normal,
        fontSize: 15,
      ),
      headlineSmall: TextStyle(
        color: AppColors.lightGreyColor,
        fontWeight: FontWeight.w500,
        fontSize: 12,
      ),
      bodyMedium:const TextStyle(
        color: Colors.black,
        fontWeight: FontWeight.w500,
        fontSize: 16,
      ) ,
      labelMedium:const TextStyle(color: Colors.white,
        fontSize: 18,
        fontWeight: FontWeight.w500,
      ) ,
    ) ,
  );
}