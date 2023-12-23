import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ecommerce_app/providers/auth_provider.dart';
import 'package:ecommerce_app/providers/home_provider.dart';
import 'package:ecommerce_app/views/splash/screen/splash_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'core/router/router.dart';
import 'core/utilites/theme_app.dart';
import 'firebase_options.dart';

void main()async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
         options: DefaultFirebaseOptions.currentPlatform,
       );
  FirebaseFirestore.instance.settings = const Settings(
    persistenceEnabled: true,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<AppAuthProvider>(create:(_) =>AppAuthProvider(),),
        ChangeNotifierProvider<HomeProvider>(create:(_) =>HomeProvider(),),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        navigatorKey:navigatorKey ,
        theme: AppTheme.lightTheme,
        home: const SplashScreen() ,
      ),
    );
  }
}

