import 'package:ecommerce_app/core/router/router.dart';
import 'package:flutter/material.dart';

import '../../product_details/screens/product_details.dart';

class CustomRowProduct extends StatelessWidget {
  const CustomRowProduct({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 145,
      child: ListView.separated(
          shrinkWrap: true,
          scrollDirection: Axis.horizontal,
          itemBuilder: (context,index)=>
           BuildItem(
             onTap: () {
               MagicRouter.navigateTo(const ProductDetails());
             },
           ),
          separatorBuilder: (context,index)=>
          const SizedBox(
            width: 10,
          ),
          itemCount: 10),
    );
  }
}

class BuildItem extends StatelessWidget {
  const BuildItem({super.key, required this.onTap});
 final  Function() onTap ;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap:onTap ,
      child: Container(
        padding: const EdgeInsets.all(10),
        decoration:BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          color: Colors.white,
        ) ,
        child:  Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.network('https://modone.com/eng_pm_Mens-plain-t-shirt-S970-blue-8855_3.jpg',
            height: 80,
            width: 80,
              fit:BoxFit.contain ,
            ),
            const SizedBox(
              height: 5,
            ),
            Text('Ankle Boots',
              style:Theme.of(context).textTheme.headlineMedium
            ),
            Text('\$49.99',
            style:Theme.of(context).textTheme.headlineMedium  ?.copyWith(
               fontSize: 12,
            ),
            ),
          ],
        ),
      ),
    );
  }
}

