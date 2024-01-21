import 'package:ecommerce_app/model/products_model.dart';
import 'package:flutter/material.dart';
import '../widgets/custom_colors_row.dart';
import '../widgets/custom_price_row.dart';
import '../widgets/custom_size_row.dart';

class CustomBody extends StatelessWidget {
  const CustomBody({super.key, required this.model,});
 final ProductsModel model ;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(10, 0, 10, 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
           CustomPriceRow(
            price:model.price ,
             rating:model.rating,
          ),
          const SizedBox(
            height: 10,
          ),
          Center(
            child: Image.network(
              model.image ??'',
              height: 220,
              width: 220,
              fit: BoxFit.contain,
              errorBuilder:(_,obj,error) {
                return const SizedBox();
              },
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          const Text('SELECT COLOR'),
          const SizedBox(
            height: 10,
          ),
          if(model.variance!['colors'] !=null)
          CustomColorsRow(colors:List.from(model.variance!['colors']!)),
          const SizedBox(
            height: 15,
          ),
          const Text('SELECT SIZE (US)'),
          const SizedBox(
            height: 10,
          ),
           if(model.variance!['size'] !=null)
           CustomSizeRow(
             size: List.from(model.variance!['size']!),
           ),
        ],
      ),
    );
  }
}
