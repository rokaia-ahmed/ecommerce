import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ecommerce_app/core/app_helper/custom_toast.dart';
import 'package:ecommerce_app/model/products_model.dart';
import 'package:flutter/cupertino.dart';

class ProductProvider{
  Future<List<ProductsModel>> getProducts()async{
    try{
      QuerySnapshot<Map<String, dynamic>> result = await  FirebaseFirestore.instance.collection('products').get();
     return result.docs.map((e) =>
         ProductsModel.fromJson(e.data(),e.id) ).toList();

    }catch(e){
      debugPrint('>>>>>>>>>>>>$e');
      showToast(text: '$e', state:ToastStates.error);
    }
    return [];
  }
}