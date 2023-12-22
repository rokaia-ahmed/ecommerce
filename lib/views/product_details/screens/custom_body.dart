import 'package:flutter/material.dart';
import '../widgets/custom_colors_row.dart';
import '../widgets/custom_price_row.dart';
import '../widgets/custom_size_row.dart';

class CustomBody extends StatelessWidget {
  const CustomBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(10, 0, 10, 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const CustomPriceRow(),
          const SizedBox(
            height: 10,
          ),
          Center(
            child: Image.network(
              'https://th.bing.com/th/id/R.72ad0e6db064296b257a0167a22eb277?rik=8szL1VSDVgA86w&riu=http%3a%2f%2fpluspng.com%2fimg-png%2fhigh-heel-png-hd-red-heel-clipart-high-heel-shoes-png-hd-2500.png&ehk=IGpxLH7Dcl%2fUR8EGN%2fuIrF%2fEEIEFvS5vEcai%2bUf2bvM%3d&risl=&pid=ImgRaw&r=0',
              height: 220,
              width: 220,
              fit: BoxFit.contain,
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          const Text('SELECT COLOR'),
          const SizedBox(
            height: 10,
          ),
          CustomColorsRow(),
          const SizedBox(
            height: 15,
          ),
          const Text('SELECT SIZE (US)'),
          const SizedBox(
            height: 10,
          ),
          const CustomSizeRow(),
        ],
      ),
    );
  }
}
