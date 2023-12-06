import 'package:flutter/material.dart';
import '../../../core/widgets/custom_text_headline.dart';
import '../widgets/custom_carousal_slider.dart';
import '../widgets/custom_row_category.dart';
import '../widgets/custom_row_product.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return  const Scaffold(
     body:SafeArea(
       child: Padding(
         padding: EdgeInsets.all(10.0),
         child: Column(
           crossAxisAlignment: CrossAxisAlignment.start,
           children: [
             CustomTextHeadLine(title: 'Categories',),
             SizedBox(
               height: 10,
             ),
             CustomRowCategory(),
             CustomTextHeadLine(title: 'Latest',),
             SizedBox(
               height: 10,
             ),
             CustomCarouselSlider(),
             SizedBox(
               height: 10,
             ),
             CustomRowProduct(),
           ],
         ),
       ),
     ) ,
    );
  }
}
