import 'package:ecommerce_app/model/cart_model.dart';
import 'package:ecommerce_app/providers/cart_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../core/utilites/colors.dart';

class CartListItem extends StatelessWidget {
  const CartListItem({super.key, required this.model});
  final CartItemsModel model;
  @override
  Widget build(BuildContext context) {
    return ( model.cartItems.isNotEmpty)
            ? Expanded(
                child: ListView.separated(
                    shrinkWrap: true,
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    itemBuilder: (context, index) => Consumer<CartProvider>(
                            builder: (context, CartProvider provider, _) {
                          return Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                decoration: BoxDecoration(
                                  boxShadow: [
                                    BoxShadow(
                                        blurRadius: 30,
                                        color: AppColors.lightGreyColor,
                                        spreadRadius: -10)
                                  ],
                                ),
                                child: CircleAvatar(
                                  backgroundColor: Colors.white,
                                  radius: 40,
                                  child: Image.network(
                                    model.cartItems[index].image!,
                                    width: 100,
                                    height: 60,
                                    fit: BoxFit.contain,
                                  ),
                                ),
                              ),
                              const SizedBox(width: 10),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text('${model.cartItems[index].name}'),
                                  Text(
                                    '\$ ${model.cartItems[index].price}',
                                    style: const TextStyle(
                                        color: AppColors.primaryColor),
                                  ),
                                  Row(
                                    children: [
                                      InkWell(
                                        onTap: () {
                                          provider.increaseItem(
                                              model.cartItems[index].id!);
                                        },
                                        child: Icon(
                                          Icons.add,
                                          color: AppColors.lightGreyColor,
                                        ),
                                      ),
                                      const SizedBox(width: 10),
                                      Text(
                                        '${model.cartItems[index].quantity}',
                                        style: const TextStyle(fontSize: 18),
                                      ),
                                      const SizedBox(width: 10),
                                      InkWell(
                                        onTap: () {
                                          provider.decreaseItem(model.cartItems[index].id!);
                                        },
                                        child: Icon(
                                          Icons.remove,
                                          color: AppColors.lightGreyColor,
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                              const Spacer(),
                              IconButton(
                                icon: const Icon(Icons.delete),
                                onPressed: () {
                                  provider.removeItem(model.cartItems[index].id!);
                                },
                              ),
                            ],
                          );
                        }),
                    separatorBuilder: (context, index) => const SizedBox(
                          height: 10,
                        ),
                    itemCount: model.cartItems.length),
              )
            : const Center(child: Text('Cart is empty'));
  }
}
