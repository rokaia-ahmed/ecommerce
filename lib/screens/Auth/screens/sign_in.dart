import 'package:ecommerce_app/core/router/router.dart';
import 'package:ecommerce_app/core/utilites/colors.dart';
import 'package:ecommerce_app/screens/Auth/screens/sign_up.dart';
import 'package:flutter/material.dart';
import '../../../core/widgets/custom_default_button.dart';
import '../../../core/widgets/custom_text_form_field.dart';
import '../../../core/widgets/custom_text_headline.dart';
import 'forget_password.dart';

class SignInScreen extends StatelessWidget {
  SignInScreen({super.key});
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:SingleChildScrollView(
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(10.0),
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
                        controller:emailController ,
                        labelText: 'USERNAME / EMAIL',
                        prefixIcon:const Icon(Icons.email_outlined) ,
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      CustomTextFormField(
                          controller:passwordController ,
                          labelText: 'PASSWORD',
                          prefixIcon:const Icon(Icons.lock_open)
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                    ],
                  ) ,
                ),
                InkWell(
                  onTap:(){
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
                  onTap: () {  },),
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
                      MagicRouter.navigateTo(SignupScreen());
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
          ),
        ),
      ) ,
    );
  }
}
