import 'package:flutter/material.dart';
import '../widgets/custom_bottom_sheet.dart';
import '../widgets/custom_details_appbar.dart';
import 'custom_body.dart';

class ProductDetails extends StatelessWidget {
  const ProductDetails({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomDetailsAppbar.get(context),
      body: const CustomBody(),
      bottomSheet: const CustomBottomSheet(),
    );
  }
}

