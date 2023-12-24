class AdsModel {
  String? id ;
  String? title ;
  String? imagePath ;

  AdsModel.fromJson(Map<String,dynamic>json,String id){
    id = id;
    title = json['title'];
    imagePath = json['image'];
  }
}