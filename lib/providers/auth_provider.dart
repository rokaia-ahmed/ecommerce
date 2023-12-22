import 'package:ecommerce_app/core/app_helper/custom_alert.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import '../core/app_helper/custom_toast.dart';
import '../core/router/router.dart';
import '../views/Auth/screens/sign_in.dart';
import '../views/layout/screen/layout.dart';

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

  checkUser(){
    FirebaseAuth.instance.authStateChanges().listen((User? user) {
      if (user == null) {
        MagicRouter.navigateAndPReplacement((const SignInScreen()));
      } else {
        MagicRouter.navigateAndPReplacement((const LayoutScreen()));
      }
    });
  }
 Future<void> signUp(context)async{
    if(formKey.currentState!.validate()) {
      try {
        customAlert(context);
        final credential = await FirebaseAuth.instance.createUserWithEmailAndPassword(
          email: emailController.text,
          password: passwordController.text,
        );
        if(credential.user != null){
          MagicRouter.pop();
          showToast(text:'you signed successfully',
              state:ToastStates.success);
          MagicRouter.navigateAndPReplacement(const SignInScreen());
        }
        if(credential.user != null && nameController.text.isNotEmpty) {
          credential.user!.updateDisplayName(nameController.text);
        }
      } on FirebaseAuthException catch (e) {
        if (e.code == 'weak-password') {
          MagicRouter.pop();
          showToast(text: 'The password provided is too weak.',
              state:ToastStates.error);
        } else if (e.code == 'email-already-in-use') {
          MagicRouter.pop();
          showToast(text: 'The account already exists for that email.',
              state:ToastStates.error);
        }
      } catch (e) {
        MagicRouter.pop();
        showToast(text: e.toString(),
            state:ToastStates.error);
        debugPrint(e.toString());
      }
    }
  }

  Future<void> login(context)async{
    if(formKey.currentState?.validate()??false){
      try{
        customAlert(context);
      final credential =  await FirebaseAuth.instance.signInWithEmailAndPassword(
            email: emailController.text,
            password: passwordController.text);
      if(credential.user != null){
        MagicRouter.pop();
        showToast(text:'you login successfully',
            state:ToastStates.success);
        MagicRouter.navigateAndPReplacement(const LayoutScreen());
      }
      }on FirebaseAuthException catch(e){
        if (e.code == 'user-not-found') {
          MagicRouter.pop();
          showToast(text:'No user found for that email.',
              state:ToastStates.error);
          debugPrint('No user found for that email.');
        } else if (e.code == 'wrong-password') {
          MagicRouter.pop();
          showToast(text:'Wrong password provided for that user.',
              state:ToastStates.error);
          debugPrint('Wrong password provided for that user.');
        }
      }catch (e) {
        MagicRouter.pop();
        showToast(text: e.toString(),
            state:ToastStates.error);
        debugPrint(e.toString());
      }
    }
  }

  signOut(context)async{
     try{
       customAlert(context);
     await Future.delayed(const Duration(seconds: 1));
       await FirebaseAuth.instance.signOut();
       showToast(text: 'you logout successfully',
           state:ToastStates.success);
        MagicRouter.pop();
     }catch(e){
       MagicRouter.pop();
       showToast(text: e.toString(),
           state:ToastStates.error);
       debugPrint(e.toString());
     }
  }
}