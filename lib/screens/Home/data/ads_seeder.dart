import 'dart:convert';

import 'package:ecommerce_app/screens/Home/model/ads_model.dart';
import 'package:flutter/services.dart';

class AdsSeeder{
  static List<AdsModel> ads = [];

  static Future<void> getAds()async{
  String response = await rootBundle.loadString('assets/jsons/ads_seeder.json');
  var  data = await jsonDecode(response) ;
  ads = (data['ads'] as List).map((e) =>
      AdsModel.fromJson(e)).toList();
  }
}