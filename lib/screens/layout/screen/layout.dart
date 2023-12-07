import 'package:ecommerce_app/core/utilites/colors.dart';
import 'package:flutter/material.dart';
import 'package:line_icons/line_icons.dart';
import '../../home/screens/home_screen.dart';
import '../widgets/custom_bottom_nav_bar.dart';

class LayoutScreen extends StatefulWidget {
  const LayoutScreen({super.key});
  @override
  State<LayoutScreen> createState() => _LayoutScreenState();
}
class _LayoutScreenState extends State<LayoutScreen> {
  int currentIndex=0 ;
  List screens = [
     const HomeScreen(),
    const Text('category'),
    const Text('favorite'),
    const Text('profile'),
  ];
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        toolbarHeight: 35,
        iconTheme: const IconThemeData(
          color: Colors.black,
        ),
       actions: [
         IconButton(
           iconSize: 30,
             icon: const Stack(
               alignment: Alignment.topRight,
               children: [
                 Icon(
                     LineIcons.facebookMessenger),
                 Badge(
                   backgroundColor: AppColors.primaryColor,
                   label:Text('0') ,
                 ),
               ],
             ),
           onPressed: () {  },),
         IconButton(
           iconSize: 30,
           icon: const Stack(
             alignment: Alignment.topRight,
             children: [
               Icon(
                   LineIcons.bell),
               Badge(
                 backgroundColor: AppColors.primaryColor,
                 label:Text('0') ,
               ),
             ],
           ),
           onPressed: () {  },),
       ],
       backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body:screens[currentIndex] ,

      bottomNavigationBar:
      CustomNavBar(
        onTap:(index){
          currentIndex = index;
          setState(() {});
        } ,
        activeIndex: currentIndex,
      ),
    );
  }
}
