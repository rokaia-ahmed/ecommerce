import 'package:ecommerce_app/model/products_model.dart';
import 'package:flutter/material.dart';
import '../widgets/custom_bottom_sheet.dart';
import '../widgets/custom_details_appbar.dart';
import 'custom_body.dart';

class ProductDetails extends StatelessWidget {
  const ProductDetails({super.key, required this.model});
 final ProductsModel model;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomDetailsAppbar.get(context,
      productName: model.name ??"no name"),
      body:  CustomBody(model: model),
      bottomSheet: const CustomBottomSheet(),
    );
  }
}

