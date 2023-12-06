import 'package:flutter/material.dart';

class CustomRowProduct extends StatelessWidget {
  const CustomRowProduct({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 145,
      child: ListView.separated(
          shrinkWrap: true,
          scrollDirection: Axis.horizontal,
          itemBuilder: (context,index)=>
          const BuildItem(),
          separatorBuilder: (context,index)=>
          const SizedBox(
            width: 10,
          ),
          itemCount: 10),
    );
  }
}

class BuildItem extends StatelessWidget {
  const BuildItem({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      decoration:BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        color: Colors.white,
      ) ,
      child:  Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Image.network('https://th.bing.com/th/id/R.51be98a51200ca64f0bb28d17120fdd9?rik=dD97el2%2fTEO3pA&pid=ImgRaw&r=0',
          height: 80,
          width: 80,
            fit:BoxFit.contain ,
          ),
          const SizedBox(
            height: 5,
          ),
          Text('Ankle Boots',
            style:Theme.of(context).textTheme.headlineSmall
                ?.copyWith(
              fontSize: 16,
            ),
          ),
          Text('\$49.99',
          style:Theme.of(context).textTheme.headlineSmall,
          ),
        ],
      ),
    );
  }
}

