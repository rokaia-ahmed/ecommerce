import 'package:ecommerce_app/core/utilites/colors.dart';
import 'package:flutter/material.dart';

class CustomSizeRow extends StatefulWidget {
   const CustomSizeRow({super.key});

  @override
  State<CustomSizeRow> createState() => _CustomSizeRowState();
}

class _CustomSizeRowState extends State<CustomSizeRow> {
  final List<Map<String,dynamic>> sizes =
  [
    {
     'size':'4.5' ,
      'isSelected':false ,
    },
    {
      'size':'5' ,
      'isSelected':false ,
    },
    {
      'size':'5.5' ,
      'isSelected':false ,
    },
    {
      'size':'6' ,
      'isSelected':false ,
    },
    {
      'size':'6.5' ,
      'isSelected':false ,
    },
    {
      'size':'7' ,
      'isSelected':false ,
    },
    {
      'size':'7.5' ,
      'isSelected':false ,
    },
    {
      'size':'8' ,
      'isSelected':false ,
    },
];
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 60,
      child: ListView.separated(
          scrollDirection: Axis.horizontal,
          shrinkWrap: true,
          itemBuilder: (context, index) => Padding(
            padding: const EdgeInsets.all(5.0),
            child: MaterialButton(
              onPressed:(){
                for (var element in sizes) {
                  element['isSelected'] = false ;
                }
                sizes[index]['isSelected']  = !sizes[index]['isSelected']  ;
                setState(() {});
              },
               minWidth: 80,
              elevation: 5,
              shape:RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15),
              ) ,
              color: Colors.white,
              textColor:sizes[index]['isSelected'] ?AppColors.primaryColor:
              AppColors.textColor ,
              child:  Text(sizes[index]['size'],
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
          itemCount: sizes.length),
    );
  }
}
