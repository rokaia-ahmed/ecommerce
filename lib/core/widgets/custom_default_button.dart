import 'package:flutter/material.dart';
import '../utilites/colors.dart';

class CustomDefaultButton extends StatelessWidget {
   const CustomDefaultButton({super.key,
     required this.text,
     required this.onTap, this.width});
  final String text ;
  final double? width ;
  final Function() onTap ;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap:onTap ,
      child: Container(
        alignment: Alignment.center,
        padding: const EdgeInsets.all(10),
        decoration:BoxDecoration(
          color: AppColors.primaryColor ,
          borderRadius: BorderRadius.circular(20),
        ) ,
        width:width ?? double.infinity,
        height: 50,
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Spacer(
              flex: 1,
            ),
            Text(text,
              textAlign: TextAlign.center,
              style:Theme.of(context).textTheme.labelMedium,
            ),
           const Spacer(
             flex: 1,
           ),
            const CircleAvatar(
              radius: 15,
              backgroundColor: Colors.white,
              child: Icon(Icons.arrow_forward_ios_outlined,
                color:AppColors.primaryColor ,
                size: 17,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class CustomSmallButton extends StatelessWidget {
  const CustomSmallButton({super.key,
    required this.text,
    this.width, required this.onTap});
  final String text ;
  final double? width ;
  final Function() onTap ;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap:onTap ,
      child: Container(
        alignment: Alignment.center,
        padding: const EdgeInsets.all(10),
        decoration:BoxDecoration(
          color:Colors.white ,
          borderRadius: BorderRadius.circular(20),
        ) ,
        width:width ?? double.infinity,
        height: 40,
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(text,
              textAlign: TextAlign.center,
              style:Theme.of(context).textTheme.headlineSmall
                  ?.copyWith(
                fontSize: 13,
              ),
            ),
            const Spacer(),
            const CircleAvatar(
              radius: 15,
              backgroundColor: AppColors.primaryColor,
              child: Icon(Icons.arrow_forward_ios_outlined,
                color:Colors.white ,
                size: 13,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

