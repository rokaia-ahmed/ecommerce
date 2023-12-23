
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ecommerce_app/views/Home/model/categories_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';

import '../views/Home/model/ads_model.dart';

class HomeProvider extends ChangeNotifier{
  List<AdsModel> adsList =[];
  List<CategoriesModel> categoriesList =[];
  getAds()async{
    try{
      QuerySnapshot<Map<String, dynamic>> data =
      await FirebaseFirestore.instance.collection('ads').get();
        for (var element in data.docs) {
          adsList.add(AdsModel.fromJson(element.data(),element.id));

        }
        notifyListeners();
      debugPrint(adsList[0].title);
    }catch(e){
      debugPrint('===================$e');
    }
  }

  getCategories()async{
    try{
      QuerySnapshot<Map<String, dynamic>> data =
      await FirebaseFirestore.instance.collection('categories').get();
      for (var element in data.docs) {
        categoriesList.add(CategoriesModel.fromJson(element.data(),element.id));
      }
      notifyListeners();
      debugPrint(categoriesList[0].name);
    }catch(e){
      debugPrint('===================$e');
    }
  }
}