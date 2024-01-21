import 'package:ecommerce_app/model/cart_model.dart';
import 'package:ecommerce_app/providers/cart_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../core/utilites/colors.dart';
import '../../../core/widgets/custom_default_button.dart';
import '../../../model/products_model.dart';
import 'custom_colors_row.dart';
import 'custom_size_row.dart';

class CustomBottomSheet extends StatelessWidget {
  const CustomBottomSheet({super.key, required this.model});
  final ProductsModel model ;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Row(
        children: [
          Expanded(
            child: CustomSmallButton(
              text: 'SHARE THIS',
              icon: Icons.arrow_upward_sharp,
              backgroundIcon: AppColors.textColor,
              height: 50,
              onTap: () {},
            ),
          ),
          const SizedBox(
            width: 10,
          ),
          Expanded(
            child: CustomSmallButton(
              text: 'ADD TO CART',
              height: 50,
              backgroundColor: AppColors.primaryColor,
              textColor: Colors.white,
              backgroundIcon: Colors.white,
              colorIcon: AppColors.primaryColor,
              onTap: () {
                Provider.of<CartProvider>(context,listen: false)
                    .addProductToCart(context,CartModel(
                  image: model.image,
                  name: model.name,
                  id: model.id,
                  price: model.price,
                  material: model.material,
                  categoryId: model.categoryId,
                  description: model.description,
                  size: CustomSizeRow.selectedSize??4.5 ,
                  quantity: 1,
                  color: CustomColorsRow.color ,
                )
                );}
            ),
          ),
        ],
      ),
    );
  }
}
