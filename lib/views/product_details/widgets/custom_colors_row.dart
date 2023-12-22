import 'package:flutter/material.dart';

class CustomColorsRow extends StatelessWidget {
  CustomColorsRow({super.key});
  final List<Color> colors = [
    Colors.black,
    Colors.pink,
    Colors.blue,
    Colors.brown,
    Colors.white,
    Colors.purple,
    Colors.red,
    Colors.yellow,
    Colors.green,
    Colors.blueGrey,
    Colors.cyan,
  ];

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 50,
      child: ListView.separated(
          scrollDirection: Axis.horizontal,
          shrinkWrap: true,
          itemBuilder: (context, index) => InkWell(
            onTap:(){} ,
            child: CircleAvatar(
                  radius: 30,
                  backgroundColor: colors[index],
                ),
          ),
          separatorBuilder: (context, index) =>
          const SizedBox(
                width: 5,
              ),
          itemCount: 11),
    );
  }
}
