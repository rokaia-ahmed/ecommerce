class CartItemsModel {
  List<CartModel> cartItems =[] ;
  CartItemsModel.fromJSon(Map<String,dynamic> json){
    for (var item in List.from(json['items'] )) {
      cartItems.add(CartModel.fromJson(item));
    }
  }
  Map<String,dynamic> toJson(){
    return {"items":cartItems.map((e) => e.toJson())};
  }
}
class CartModel {
  String? id ;
  String? name ;
  String? image ;
  double? price ;
  double? rating ;
  int? quantity ;
  String? description ;
  String? material ;
  String? brand ;
  String? categoryId ;
   num? size;
   String? color;

  CartModel({
    this.categoryId,
    this.price,
    this.image,
    this.id,
    this.name,
    this.rating,
    this.material,
    this.quantity,
    this.brand,
    this.size,
    this.color,
    this.description,
  });

  CartModel.fromJson(Map<String,dynamic>json){
    id = json['id'];
    name = json['name'];
    image = json['image'];
    price = json['price'];
    quantity = json['quantity'];
    rating = json['rating'] is int ?
    (json['rating'] as int).toDouble() :json['rating'] ;
    description = json['description'];
    brand = json['brand'];
    categoryId = json['category-id'];
    material = json['material'];
    color=json['color'];
    size=json['size'];
  }
  Map<String,dynamic> toJson(){
    return {
    "id": id ,
    "name":name,
    "image":image,
    "price":price,
    "quantity":quantity,
    "category-id" :categoryId,
    "material" :categoryId,
    "size" :size,
    "color" :color,
    };
  }
}

