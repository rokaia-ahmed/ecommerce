import 'package:flutter/material.dart';

import '../../../core/utilites/colors.dart';

class CustomPriceRow extends StatelessWidget {
  const CustomPriceRow({super.key, this.rating, this.price});
  final double? rating;
  final double? price;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text('\$ $price',
          style: Theme.of(context).textTheme.bodyMedium?.copyWith(
            fontWeight: FontWeight.bold
          ),
        ),
        const SizedBox(
          width: 10,
        ),
        Container(
          padding: const EdgeInsets.all(5),
          decoration: BoxDecoration(
            color: AppColors.primaryColor,
            borderRadius: BorderRadius.circular(15),
          ),
          child:Row(
            children: [
              const Icon(Icons.star,
                size: 15,
                color: Colors.white,
              ),
              const SizedBox(
                width: 5,
              ),
              Text('$rating',
                style: Theme.of(context).textTheme.labelMedium?.copyWith(
                  fontSize: 12,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ) ,
        ),
      ],
    );
  }
}
