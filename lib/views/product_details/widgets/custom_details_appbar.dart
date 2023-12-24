import 'package:ecommerce_app/core/router/router.dart';
import 'package:flutter/material.dart';
import 'package:line_icons/line_icons.dart';
import '../../../core/utilites/colors.dart';

class CustomDetailsAppbar{
  static PreferredSize  get(context,{required String productName}) =>
      PreferredSize(
    preferredSize: const Size.fromHeight(50),
    child: AppBar(
      title: Text(productName,
        style: Theme.of(context).textTheme.bodyMedium,),
      centerTitle: true,
      leading: IconButton(
        onPressed:(){
          MagicRouter.pop();
        } ,
        icon: const Icon(Icons.arrow_back_ios_rounded,
        color: AppColors.primaryColor,
        ),
      ),
      actions: [
        IconButton(
          onPressed:(){},
          icon: const Stack(
            alignment: Alignment.bottomLeft,
            children: [
              Icon(LineIcons.shoppingCart,
                size: 33,
                color:AppColors.textColor ,
              ),
              Badge(
                backgroundColor:AppColors.primaryColor ,
                label:Text('0') ,
              ),
            ],
          ),
        ),
      ],
    ),
  );
}