import 'package:ecommerce_app/screens/Auth/screens/sign_in.dart';
import 'package:flutter/material.dart';
import 'core/router/router.dart';
import 'core/utilites/theme_app.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      navigatorKey:navigatorKey ,
      theme: AppTheme.lightTheme,
      home: SignInScreen() ,
    );
  }
}

