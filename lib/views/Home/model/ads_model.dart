class AdsModel {
  int? id ;
  String? title ;
  String? imagePath ;

  AdsModel.fromJson(Map<String,dynamic>json){
    id = json['id'];
    title = json['title'];
    imagePath = json['imagePath'];
  }
}