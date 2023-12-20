import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';

import '../core/router/router.dart';
import '../screens/Auth/screens/sign_in.dart';
import '../screens/layout/screen/layout.dart';

class AppAuthProvider extends ChangeNotifier{
  late GlobalKey<FormState> formKey ;
  late  TextEditingController emailController ;
  late  TextEditingController nameController ;
  late  TextEditingController passwordController ;
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

 Future<void> signUp()async{
    if(formKey.currentState!.validate()) {
      try {
        final credential = await FirebaseAuth.instance.createUserWithEmailAndPassword(
          email: emailController.text,
          password: passwordController.text,
        );
        if(credential.user != null){
          MagicRouter.navigateAndPReplacement(const SignInScreen());
        }
        if(credential.user != null && nameController.text.isNotEmpty) {
          credential.user!.updateDisplayName(nameController.text);
        }
      } on FirebaseAuthException catch (e) {
        if (e.code == 'weak-password') {
          debugPrint('The password provided is too weak.');
        } else if (e.code == 'email-already-in-use') {
          debugPrint('The account already exists for that email.');
        }
      } catch (e) {
        debugPrint(e.toString());
      }
    }
  }

  Future<void> login()async{
    if(formKey.currentState!.validate()){
      try{
      final credential =  await FirebaseAuth.instance.signInWithEmailAndPassword(
            email: emailController.text,
            password: passwordController.text);
      if(credential.user != null){
        MagicRouter.navigateAndPReplacement(const LayoutScreen());
      }
      }on FirebaseAuthException catch(e){
        if (e.code == 'user-not-found') {
          debugPrint('No user found for that email.');
        } else if (e.code == 'wrong-password') {
          debugPrint('Wrong password provided for that user.');
        }
      }
    }
  }
}