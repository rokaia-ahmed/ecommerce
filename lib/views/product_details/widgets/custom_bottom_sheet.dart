import 'package:flutter/material.dart';
import '../../../core/utilites/colors.dart';
import '../../../core/widgets/custom_default_button.dart';

class CustomBottomSheet extends StatelessWidget {
  const CustomBottomSheet({super.key});

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
              onTap: () {},
            ),
          ),
        ],
      ),
    );
  }
}
