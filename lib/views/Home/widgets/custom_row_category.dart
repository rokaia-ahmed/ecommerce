import 'package:ecommerce_app/core/utilites/colors.dart';
import 'package:ecommerce_app/model/categories_model.dart';
import 'package:ecommerce_app/providers/home_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CustomRowCategory extends StatefulWidget {
  const CustomRowCategory({super.key});

  @override
  State<CustomRowCategory> createState() => _CustomRowCategoryState();
}

class _CustomRowCategoryState extends State<CustomRowCategory> {
  @override
  void initState() {
    Provider.of<HomeProvider>(context,listen: false).getCategories();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Consumer<HomeProvider>(
      builder: ( context, HomeProvider homeProvider, child) {
        return (homeProvider.categoriesList.isNotEmpty)?
          SizedBox(
          height: 90,
          child: ListView.separated(
              shrinkWrap: true,
              scrollDirection:Axis.horizontal ,
              itemBuilder: (context,index)=>
               BuildItem(homeProvider.categoriesList[index]),
              separatorBuilder: (context,index)=>
              const SizedBox(
                width: 10,),
              itemCount: homeProvider.categoriesList.length),
        ):const Center(child: CircularProgressIndicator(
          color: AppColors.primaryColor,
        ));
      },
    );
  }
}

class BuildItem extends StatelessWidget {
  const BuildItem(this.model, {super.key});
 final CategoriesModel model ;
  @override
  Widget build(BuildContext context) {
    return  Column(
      children: [
         CircleAvatar(
          radius: 30,
          backgroundImage:NetworkImage('${model.image}'),
          onBackgroundImageError:(_,error){
           debugPrint('error $error');
          },
        ),
        const SizedBox(
          height: 2,
        ),
        Text('${model.name}'),
      ],
    );
  }
}

