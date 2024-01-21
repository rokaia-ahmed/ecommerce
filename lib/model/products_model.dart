
class ProductsModel {
  String? id ;
  String? name ;
  String? image ;
  double? price ;
  double? rating ;
  String? description ;
  String? material ;
  String? brand ;
  String? categoryId ;
  Map<String, List<dynamic>>? variance;

  ProductsModel.fromJson(Map<String,dynamic>json,
      String this.id){
    name = json['name'];
    image = json['image'];
    price = json['price'];
    rating = json['rating'] is int ?
    (json['rating'] as int).toDouble() :json['rating'] ;
    description = json['description'];
    brand = json['brand'];
    categoryId = json['category-id'];
    material = json['material'];
    variance = Map<String, List<dynamic>>.from(json['variance']);
  }
}

