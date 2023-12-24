import 'package:ecommerce_app/core/router/router.dart';
import 'package:ecommerce_app/model/products_model.dart';
import 'package:ecommerce_app/providers/products_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../product_details/screens/product_details.dart';

class CustomRowProduct extends StatefulWidget {
  const CustomRowProduct({super.key});

  @override
  State<CustomRowProduct> createState() => _CustomRowProductState();
}

class _CustomRowProductState extends State<CustomRowProduct> {

  /*@override
  void initState() {
    Provider.of<ProductProvider>(context,listen: false).getProducts();
    super.initState();
  }*/
  @override
  Widget build(BuildContext context) {
    return Consumer<ProductProvider>(
      builder: (context,productProvider,_){
        return FutureBuilder(
            future: productProvider.getProducts(),
            builder: (context, snapshot) {
              if(snapshot.hasData) {
                return SizedBox(
                height: 150,
                child: ListView.separated(
                    shrinkWrap: true,
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context,index)=>
                        BuildItem(
                          snapshot.data![index],
                          onTap: () {
                            MagicRouter.navigateTo( ProductDetails(
                              model: snapshot.data![index],
                            ));
                          },
                        ),
                    separatorBuilder: (context,index)=> const SizedBox(
                      width: 10,
                    ),
                    itemCount: snapshot.data!.length),
              );
              }else if(snapshot.connectionState ==ConnectionState.waiting){
                return const Center(child: CircularProgressIndicator());
              }else if(snapshot.hasError){
               return Text('some thing error ${snapshot.error.toString()}');
              }else{
                return Text("connectionState ${snapshot.connectionState}");
              }
            }
        );
      },
    );
  }
}

class BuildItem extends StatelessWidget {
  const BuildItem(this.model,{super.key, required this.onTap});
 final  Function() onTap ;
 final  ProductsModel model ;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap:onTap ,
      child: Container(
        padding: const EdgeInsets.all(10),
        decoration:BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          color: Colors.white,
        ) ,
        child:  Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.network(
              model.image??'',
            height: 90,
            width: 90,
              fit:BoxFit.contain ,
              errorBuilder: (_,object,error){
                return const SizedBox();
              },
            ),
            const SizedBox(
              height: 5,
            ),
            Text('${model.name}',
              style:Theme.of(context).textTheme.headlineMedium
            ),
            Text('\$ ${model.price}',
            style:Theme.of(context).textTheme.headlineMedium  ?.copyWith(
               fontSize: 12,
            ),
            ),
          ],
        ),
      ),
    );
  }
}

