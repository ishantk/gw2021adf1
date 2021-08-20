// This is what we will add in the Cart
class Dish{

  String? name;
  int? price;
  int? quantity;
  int? totalPrice;

  Dish({this.name, this.price, this.quantity, this.totalPrice});

  // Named Constructor
  Dish.myDish();

  toMap(){
    return {
      "name": name,
      "price": price,
      "quantity": quantity,
      "totalPrice": totalPrice,
    };
  }
}