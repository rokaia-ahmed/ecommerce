import 'package:ecommerce_app/core/utilites/colors.dart';
import 'package:ecommerce_app/providers/auth_provider.dart';
import 'package:ecommerce_app/providers/cart_provider.dart';
import 'package:flutter/material.dart';
import 'package:line_icons/line_icons.dart';
import 'package:provider/provider.dart';
import '../../../core/srevices/firebase_notification_service.dart';
import '../../cart/screens/cart_screen.dart';
import '../../home/screens/home_screen.dart';
import '../widgets/custom_bottom_nav_bar.dart';

class LayoutScreen extends StatefulWidget {
   int currentIndex ;
   LayoutScreen({super.key, this.currentIndex =0});
  @override
  State<LayoutScreen> createState() => _LayoutScreenState();
}

class _LayoutScreenState extends State<LayoutScreen> {
  List screens = [
    const HomeScreen(),
    const Text('search'),
    const CartScreen(),
    const Text('profile'),
  ];
  @override
  void initState() {
    super.initState();
    Provider.of<CartProvider>(context,listen: false).getCartItems();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 38,
        iconTheme: const IconThemeData(
          color: Colors.black,
        ),
        leadingWidth: 80,
        leading: TextButton(
          onPressed: () {
            PushNotificationService.onPushNotificationClosed();
            Provider.of<AppAuthProvider>(context, listen: false).signOut(context);
          },
          child: Text(
            'logout',
            style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                  fontWeight: FontWeight.bold,
                ),
          ),
        ),
        actions: [
          Consumer<CartProvider>(
            builder: (context,provider,_) {
              return IconButton(
                iconSize: 30,
                icon:  Stack(
                  alignment: Alignment.topRight,
                  children: [
                    const Icon(LineIcons.shoppingCart),
                    Badge(
                      backgroundColor: AppColors.primaryColor,
                      label: Text('${provider.cartItemsModel?.cartItems.length}'),
                    ),
                  ],
                ),
                onPressed: () {
                 widget.currentIndex =2 ;
                  setState(() {});
                },
              );
            }
          ),
          IconButton(
            iconSize: 30,
            icon: const Stack(
              alignment: Alignment.topRight,
              children: [
                Icon(LineIcons.bell),
                Badge(
                  backgroundColor: AppColors.primaryColor,
                  label: Text('0'),
                ),
              ],
            ),
            onPressed: () {},
          ),
        ],
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: screens[widget.currentIndex],
      bottomNavigationBar: CustomNavBar(
        onTap: (index) {
          widget.currentIndex = index;
          setState(() {});
        },
        activeIndex: widget.currentIndex,
      ),
    );
  }
}
