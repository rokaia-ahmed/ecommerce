import 'package:flutter/material.dart';

import '../../../providers/auth_provider.dart';

class PasswordIcon extends StatelessWidget {
  const PasswordIcon({super.key, required this.appAuthProvider});
  final AppAuthProvider appAuthProvider ;
  @override
  Widget build(BuildContext context) {
    return InkWell(
        onTap:(){
          appAuthProvider.toggleObscure();
        } ,
        child:
        Icon(appAuthProvider.obscureText == true?
        Icons.visibility: Icons.visibility_off)
    );
  }
}
