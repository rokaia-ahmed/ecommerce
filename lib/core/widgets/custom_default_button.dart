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
    this.width, required this.onTap,
    this.height, this.backgroundColor,
    this.backgroundIcon, this.colorIcon,
    this.textColor, this.icon});

  final String text ;
  final double? width ;
  final double? height ;
  final Function() onTap ;
  final Color? backgroundColor ;
  final Color? backgroundIcon ;
  final Color? colorIcon ;
  final Color? textColor ;
  final IconData? icon ;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap:onTap ,
      child: Container(
        alignment: Alignment.center,
        padding: const EdgeInsets.all(10),
        decoration:BoxDecoration(
          color:backgroundColor?? Colors.white ,
          borderRadius: BorderRadius.circular(20),
        ) ,
        width:width ?? double.infinity,
        height:height ?? 50,
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(text,
              textAlign: TextAlign.center,
              style:Theme.of(context).textTheme.headlineSmall
                  ?.copyWith(
                fontSize: 14,
                color:textColor ,
                fontWeight: FontWeight.bold
              ),
            ),
            const Spacer(),
             CircleAvatar(
              radius: 15,
              backgroundColor:backgroundIcon??
                  AppColors.primaryColor,
              child: Icon(
                icon ?? Icons.arrow_forward_ios_outlined,
                color:colorIcon??Colors.white ,
                size: 13,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

