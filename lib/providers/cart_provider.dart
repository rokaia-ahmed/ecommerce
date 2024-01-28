import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ecommerce_app/core/app_helper/custom_toast.dart';
import 'package:ecommerce_app/model/cart_model.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class CartProvider extends ChangeNotifier{

  CartItemsModel? cartItemsModel ;
  void getCartItems()async{
    try{
      var result = await
      FirebaseFirestore.instance.collection('carts').doc(
          FirebaseAuth.instance.currentUser?.email).get();
      if(result.exists){
        cartItemsModel = CartItemsModel.fromJSon(result.data()!);
      }
      notifyListeners();
      print('success');
    }
    catch(e){
      print('=================$e');
    }
  }

  double calculateTotalPrize(){
    double total = 0 ;
    if(cartItemsModel !=null){
      for (var element in cartItemsModel!.cartItems) {
        total=total + (element.price!*element.quantity!) ;
      }
    }
    return total ;
  }

  void addProductToCart(BuildContext context,CartModel cartModel)async{
    try{
        var data=  await FirebaseFirestore.instance.
        collection('carts')
            .doc(FirebaseAuth.instance.currentUser?.email).get();
      if(data.exists){
        for (var item in List.from(data.data()!['items'])) {
          if(item['id']==cartModel.id){
            cartItemsModel!.cartItems.removeWhere(
                    (element) => element.id == cartModel.id );
            cartItemsModel!.cartItems.add(cartModel);
            var result = FirebaseFirestore.instance.
            collection('carts').
            doc(FirebaseAuth.instance.currentUser?.email
            ).set(cartItemsModel!.toJson());
            result.then((value){
              showToast(text: 'item updated successfully',
                  state: ToastStates.success);
            });
          }
          else{
            var result = FirebaseFirestore.instance.
            collection('carts').
            doc(FirebaseAuth.instance.currentUser?.email
            ).update({'items': FieldValue.arrayUnion([cartModel.toJson()])});
            result.then((value){
              showToast(text: 'item added successfully',
                  state: ToastStates.success);
              print('item add success');
            });
          }
        }
      }else{
        var result = FirebaseFirestore.instance.
        collection('carts').
        doc(FirebaseAuth.instance.currentUser?.email
        ).set({'items':[cartModel.toJson()]});
        result.then((value){
          showToast(text: 'item added successfully',
              state: ToastStates.success);
        });
      }
    }catch(e){
      debugPrint('error when add item to cart ===============$e');
    }
}

  void increaseItem(String itemId)async{
    try{
      for(var item in cartItemsModel!.cartItems){
        if(item.id==itemId){
          item.quantity = item.quantity!+1;
        }
      }
       await FirebaseFirestore.instance.
      collection('carts')
          .doc(FirebaseAuth.instance.currentUser?.email
      ).update(cartItemsModel!.toJson());
      getCartItems();
      notifyListeners();
    }catch(e){
      print(e);
    }
  }

  void decreaseItem(String itemId)async{
    try{
      for(var item in cartItemsModel!.cartItems){
        if(item.id==itemId){
         if(item.quantity! >1) {
           item.quantity = item.quantity!-1;
           await FirebaseFirestore.instance.
           collection('carts')
               .doc(FirebaseAuth.instance.currentUser?.email
           ).update(cartItemsModel!.toJson());
           getCartItems();
           notifyListeners();
         }else{
           return ;
         }
        }
      }
    }catch(e){
      print(e);
    }
  }

  void removeItem(String itemId)async{
    try{
       cartItemsModel!.cartItems.removeWhere(
            (element) => element.id == itemId );
    await FirebaseFirestore.instance.
    collection('carts')
        .doc(FirebaseAuth.instance.currentUser?.email
    ).update(cartItemsModel!.toJson());
       getCartItems();
       notifyListeners();
    }catch(e){
      print(e);
    }
  }

}