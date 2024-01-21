import 'package:ecommerce_app/core/utilites/colors.dart';
import 'package:ecommerce_app/providers/cart_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../core/widgets/custom_default_button.dart';
import '../../../core/widgets/custom_text_headline.dart';
import '../widgets/cart_list_items.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({super.key});

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  @override
  void initState() {
    super.initState();
    Provider.of<CartProvider>(context,listen: false).getCartItems();
  }
  @override
  Widget build(BuildContext context) {
    return Consumer<CartProvider>(
      builder: (context,CartProvider provider,_) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const CustomTextHeadLine(title: 'Cart',),
            const SizedBox(
              height: 10,
            ),
            (provider.cartItemsModel !=null)?
             CartListItem(model: provider.cartItemsModel!):
            const Center(child: CircularProgressIndicator()),
            if(provider.cartItemsModel ==null ||provider.cartItemsModel!.cartItems.isEmpty)
            const Spacer(),
            PhysicalModel(
              color: Colors.transparent,
             elevation: 0.5,
             child:Padding(
               padding: const EdgeInsets.symmetric(
                   horizontal: 10,vertical: 2),
               child: Row(
                 children: [
                    Expanded(
                       child: Text('Total : \$${provider.calculateTotalPrize()}'),
                   ),
                   Expanded(
                     child: CustomSmallButton(
                       text: 'buy now',
                       height: 40,
                       backgroundColor:AppColors.primaryColor ,
                       backgroundIcon: Colors.white,
                       colorIcon:AppColors.primaryColor ,
                       textColor: Colors.white,
                       onTap: () {},
                     ),
                   ),
                 ],
               ),
             ) ,
            ),
          ],
        );
      }
    );
  }
}
