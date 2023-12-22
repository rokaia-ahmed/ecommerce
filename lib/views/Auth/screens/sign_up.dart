import 'package:ecommerce_app/core/utilites/validation.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../core/widgets/custom_default_button.dart';
import '../../../core/widgets/custom_text_form_field.dart';
import '../../../core/widgets/custom_text_headline.dart';
import '../../../providers/auth_provider.dart';
import '../widgets/password_Icon.dart';

class SignupScreen extends StatefulWidget {
   const SignupScreen({super.key});

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}
class _SignupScreenState extends State<SignupScreen> {
  @override
  void initState() {
    Provider.of<AppAuthProvider>(context,listen: false).init();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:SingleChildScrollView(
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Consumer<AppAuthProvider>(
              builder:(context,appAuthProvider ,_){
                return Form(
                  key:appAuthProvider.formKey ,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(
                        height: 20,
                      ),
                      const CustomTextHeadLine(title: 'Sign Up'),
                      const SizedBox(
                        height: 40,
                      ),
                      Container(
                        padding:const EdgeInsets.all(10) ,
                        decoration:  BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: Colors.white,

                        ),
                        child:Column(
                          children: [
                            CustomTextFormField(
                              controller:appAuthProvider.emailController ,
                              labelText: 'EMAIL',
                              prefixIcon:const Icon(Icons.email_outlined) ,
                              validator:(value){
                                if(value!.isEmpty){
                                  return 'email is required';
                                }else if(!value.isValidEmail){
                                  return 'invalid email';
                                }
                                return null ;
                              } ,
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            CustomTextFormField(
                                controller:appAuthProvider.nameController ,
                                labelText: 'USERNAME',
                                prefixIcon:const Icon(Icons.person_outline_outlined)
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            CustomTextFormField(
                                obscureText:appAuthProvider.obscureText ,
                                controller:appAuthProvider.passwordController ,
                                labelText: 'PASSWORD',
                                suffixIcon: PasswordIcon(appAuthProvider: appAuthProvider),
                                prefixIcon:const Icon(Icons.lock_open),
                              validator:(value){
                                if(value!.isEmpty){
                                  return 'password is required';
                                }else if(!value.isValidPassword){
                                  return 'invalid password';
                                }
                                return null ;
                              } ,
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                          ],
                        ) ,
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      CustomDefaultButton(
                        text: 'SIGN UP',
                        onTap:  ()async{
                         await appAuthProvider.signUp(context);
                        },
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Text('By creating an account, you agree to our Terms of Service and Privacy Policy',
                        textAlign: TextAlign.center,
                        style:Theme.of(context).textTheme.headlineSmall?.copyWith(
                          fontWeight: FontWeight.bold,
                          fontSize: 14,
                        ) ,
                      ),
                    ],
                  ),
                );
              } ,
            ),
          ),
        ),
      ) ,
    );
  }
}
