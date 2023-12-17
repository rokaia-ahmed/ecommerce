import 'package:ecommerce_app/core/router/router.dart';
import 'package:ecommerce_app/screens/Auth/screens/sign_in.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}
class _SplashScreenState extends State<SplashScreen> {

  @override
  void initState() {
    Future.delayed(const Duration(
      seconds: 5,
    ),() {
      FirebaseAuth.instance.authStateChanges().listen((User? user) {
        if (user == null) {
          print('User is currently signed out!');
        } else {
          print('User is signed in!');
        }
      });
      MagicRouter.navigateTo(SignInScreen());
    },
    );
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
          child: FlutterLogo(
            size: 150,
          ),
      ),
    );
  }
}
