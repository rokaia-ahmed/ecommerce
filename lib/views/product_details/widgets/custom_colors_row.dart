import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../providers/products_provider.dart';

class CustomColorsRow extends StatelessWidget {
   const CustomColorsRow({super.key, required this.colors});
  final List<String> colors ;
  static String? color ;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 50,
      child: Consumer<ProductProvider>(
        builder:(context,provider,_){
          return ListView.separated(
              scrollDirection: Axis.horizontal,
              shrinkWrap: true,
              itemBuilder: (context, index) {
                return InkWell(
                onTap:(){
                  for(int i = 0;i < colors.length ;i++){
                    provider.isSelectedColor[i]=false ;
                  }
                  color = colors[index];
                  provider.changeColorSelected(index);
                },
                child: CircleAvatar(
                    radius: 30,
                    backgroundColor:
                    Color(int.parse(colors[index])),
                    child:provider.isSelectedColor[index]==true?
                    const Icon(Icons.check,
                      color: Colors.white,
                    ):const SizedBox()
                ),
              );
              },
              separatorBuilder: (context, index) =>
              const SizedBox(
                width: 5,
              ),
              itemCount: colors.length);
        } ,
      ),
    );
  }
}
