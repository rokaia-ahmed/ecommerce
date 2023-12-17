import 'package:ecommerce_app/screens/Auth/screens/sign_in.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'core/router/router.dart';
import 'core/utilites/theme_app.dart';
import 'firebase_options.dart';

void main()async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
         options: DefaultFirebaseOptions.currentPlatform,
       );
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

