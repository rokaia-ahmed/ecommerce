import 'package:ecommerce_app/providers/products_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../core/utilites/colors.dart';

class CustomSizeRow extends StatefulWidget {
    const CustomSizeRow({super.key, required this.size,});
   final List<num> size;
  static  num? selectedSize ;
  @override
  State<CustomSizeRow> createState() => _CustomSizeRowState();
}

class _CustomSizeRowState extends State<CustomSizeRow> {
 int isSelected = -1 ;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 60,
      child: Consumer<ProductProvider>(
        builder: (context,provider,_) {
          return ListView.separated(
              scrollDirection: Axis.horizontal,
              shrinkWrap: true,
              itemBuilder: (context, index) => Padding(
                padding: const EdgeInsets.all(5.0),
                child: MaterialButton(
                  onPressed:(){
                    isSelected = index ;
                    CustomSizeRow.selectedSize = widget.size[index];
                    print(widget.size[index]);
                    setState(() {});
                  },
                   minWidth: 80,
                  elevation: 5,
                  shape:RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15),
                  ) ,
                  color: Colors.white,
                  textColor: isSelected == index?
                  AppColors.primaryColor:
                  AppColors.textColor ,
                  child:  Text(widget.size[index].toString(),
                  style:const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 15,
                  ) ,
                  ),
                ),
              ),
              separatorBuilder: (context, index) =>
              const SizedBox(
                width: 10,
              ),
              itemCount: widget.size.length);
        }
      ),
    );
  }
}
