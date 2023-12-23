import 'dart:ffi';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';

import '../views/Home/model/ads_model.dart';

class HomeProvider extends ChangeNotifier{
  List<AdsModel> adsList =[];
  getAds()async{
    try{
      QuerySnapshot<Map<String, dynamic>> data =
      await FirebaseFirestore.instance.collection('ads').get();
        for (var element in data.docs) {
          adsList.add(AdsModel.fromJson(element.data(),element.id));

        }
        notifyListeners();
      print(adsList[0].title);
    }catch(e){
     print('===================$e');
    }
  }
}