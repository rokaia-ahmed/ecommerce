import 'package:flutter/cupertino.dart';

class AppAuthProvider extends ChangeNotifier{
  late GlobalKey<FormState> formKey ;
  late final TextEditingController emailController ;
  late final TextEditingController nameController ;
  late final TextEditingController passwordController ;
  bool obscureText = false;
   void init(){
     formKey = GlobalKey<FormState>();
     emailController = TextEditingController();
     nameController = TextEditingController();
     passwordController = TextEditingController();
   }

  void providerDispose(){
    emailController.dispose();
    nameController.dispose();
    passwordController.dispose();
  }

 void toggleObscure(){
   obscureText = !obscureText ;
   notifyListeners();
  }
}