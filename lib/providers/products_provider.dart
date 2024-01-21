import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ecommerce_app/core/app_helper/custom_toast.dart';
import 'package:ecommerce_app/model/products_model.dart';
import 'package:flutter/cupertino.dart';

class ProductProvider extends ChangeNotifier{
  Future<List<ProductsModel>> getProducts()async{
    try{
      QuerySnapshot<Map<String, dynamic>> result = await  FirebaseFirestore.instance.collection('products').get();
     List<ProductsModel> product =  result.docs.map((e) =>
         ProductsModel.fromJson(e.data(),e.id) ).toList();
    return product ;
    }catch(e){
      debugPrint('>>>>>>>>>>>>$e');
      showToast(text: '$e', state:ToastStates.error);
    }
    return [];
  }

  Map<int,bool> isSelectedColor ={} ;
  void changeColorSelected(index){
    isSelectedColor[index] = !isSelectedColor[index]! ;
   notifyListeners();
  }
}