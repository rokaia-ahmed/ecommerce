
import 'package:ecommerce_app/core/utilites/validation.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../core/widgets/custom_default_button.dart';
import '../../../core/widgets/custom_text_form_field.dart';
import '../../../core/widgets/custom_text_headline.dart';
import '../../../providers/auth_provider.dart';

class ForgetPasswordScreen extends StatefulWidget {
  const ForgetPasswordScreen({super.key});

  @override
  State<ForgetPasswordScreen> createState() => _ForgetPasswordScreenState();
}

class _ForgetPasswordScreenState extends State<ForgetPasswordScreen> {
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
              builder: (context,provider,_) {
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(
                      height: 20,
                    ),
                    const CustomTextHeadLine(title:'Forgot Password'),
                    const SizedBox(
                      height: 40,
                    ),
                    Text('Enter the email address you used to create your account and we will email you a link to reset your password',
                      textAlign: TextAlign.center,
                      style:Theme.of(context).textTheme.headlineSmall?.copyWith(
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                      ) ,
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Container(
                      padding:const EdgeInsets.all(10) ,
                      decoration:  BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Colors.white,

                      ),
                      child:Form(
                        key:provider.formKey ,
                        child: Column(
                          children: [
                            CustomTextFormField(
                              controller:provider.emailController ,
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
                          ],
                        ),
                      ) ,
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    CustomDefaultButton(
                      text: 'SEND EMAIL',
                      onTap: () {
                        provider.forgetPassword();
                      },),
                  ],
                );
              }
            ),
          ),
        ),
      ) ,
    );
  }
}
