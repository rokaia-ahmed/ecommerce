import 'package:flutter/material.dart';

class CustomRowCategory extends StatelessWidget {
  const CustomRowCategory({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 90,
      child: ListView.separated(
          shrinkWrap: true,
          scrollDirection:Axis.horizontal ,
          itemBuilder: (context,index)=>
          const BuildItem(),
          separatorBuilder: (context,index)=>
          const SizedBox(
            width: 10,
          ),
          itemCount: 6),
    );
  }
}

class BuildItem extends StatelessWidget {
  const BuildItem({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        CircleAvatar(
          radius: 30,
          child: Icon(Icons.add_business_outlined,
            size: 35,
          ),
        ),
        SizedBox(
          height: 2,
        ),
        Text('Beauty'),
      ],
    );
  }
}

