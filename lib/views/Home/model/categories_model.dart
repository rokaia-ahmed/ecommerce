class CategoriesModel {
  String? id ;
  String? name ;
  String? image ;

  CategoriesModel.fromJson(Map<String,dynamic>json,String id){
    id = id;
    name = json['name'];
    image = json['image'];
  }
}