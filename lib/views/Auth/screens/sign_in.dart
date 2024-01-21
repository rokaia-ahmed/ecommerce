import 'package:ecommerce_app/core/router/router.dart';
import 'package:ecommerce_app/core/utilites/colors.dart';
import 'package:ecommerce_app/core/utilites/validation.dart';
import 'package:ecommerce_app/views/Auth/screens/sign_up.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../core/widgets/custom_default_button.dart';
import '../../../core/widgets/custom_text_form_field.dart';
import '../../../core/widgets/custom_text_headline.dart';
import '../../../providers/auth_provider.dart';
import '../widgets/password_Icon.dart';
import 'forget_password.dart';

class SignInScreen extends StatefulWidget {
  const SignInScreen({super.key});

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  @override
  void initState() {
    Provider.of<AppAuthProvider>(context,listen:false).init();
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
              builder: (context,appAuthProvider ,_){
                return Form(
                  key:appAuthProvider.formKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(
                        height: 20,
                      ),
                      const CustomTextHeadLine(title: 'Log In'),
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
                              labelText: 'USERNAME / EMAIL',
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
                              obscureText:appAuthProvider.obscureText ,
                                controller:appAuthProvider.passwordController ,
                                labelText: 'PASSWORD',
                                suffixIcon: PasswordIcon(appAuthProvider: appAuthProvider),
                                prefixIcon:const Icon(Icons.lock_open),
                              validator:(value){
                                if(value!.isEmpty){
                                  return 'password is required';
                                }else if(!value.isValidPassword){
                                  return 'password must have at least letter and special char';
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
                      InkWell(
                        onTap:(){
                         /* appAuthProvider.forgetPassword(
                              appAuthProvider.emailController.text);*/
                         MagicRouter.navigateTo(ForgetPasswordScreen());
                        } ,
                        child: Align(
                          alignment: Alignment.topRight,
                          child: Text('forget password?',
                            textAlign: TextAlign.center,
                            style:Theme.of(context).textTheme.headlineSmall?.copyWith(
                              fontSize:14,
                              fontWeight: FontWeight.bold,
                              color: AppColors.primaryColor,
                            ) ,
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      CustomDefaultButton(
                        text: 'LOG IN',
                        onTap: ()async {
                         await appAuthProvider.login(context);
                        },
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Center(
                        child: Text('Don’t have an account?',
                          textAlign: TextAlign.center,
                          style:Theme.of(context).textTheme.headlineSmall?.copyWith(
                            fontSize: 14,
                            fontWeight: FontWeight.bold,
                          ) ,
                        ),
                      ),
                      Center(
                        child: InkWell(
                          onTap:(){
                            MagicRouter.navigateTo(const SignupScreen());
                          } ,
                          child: Text(' create a new account.',
                            textAlign: TextAlign.center,
                            style:Theme.of(context).textTheme.headlineSmall?.copyWith(
                              fontSize:14,
                              fontWeight: FontWeight.bold,
                              color: AppColors.primaryColor,
                            ) ,
                          ),
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
        ),
      ) ,
    );
  }
}
