import 'package:flutter/material.dart';

import '../widgets/custom_carousal_slider.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
     body:SafeArea(
       child: Column(
         mainAxisAlignment: MainAxisAlignment.center,
         children: [
           CustomCarouselSlider(),
         ],
       ),
     ) ,
    );
  }
}
