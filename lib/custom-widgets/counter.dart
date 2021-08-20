import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:gw2021adf1/model/dish.dart';
import 'package:gw2021adf1/util/constants.dart';

class Counter extends StatefulWidget {

  Map<String, dynamic>? dish;

  Counter({Key? key, @required this.dish}) : super(key: key);

  @override
  _CounterState createState() => _CounterState();
}

class _CounterState extends State<Counter> {

  int initialValue = 0;

  @override
  Widget build(BuildContext context) {

    updateDishInCart(){
      Dish cartDish = Dish(name: widget.dish!['name'].toString(),
          price: widget.dish!['price'],
          quantity: initialValue,
          totalPrice: initialValue * (widget.dish!['price'] as int)
      );

      // here you need to now add the dish with quantity as 1 in dishes cart
      FirebaseFirestore.instance.collection(Util.USERS_COLLECTION)
          .doc(Util.appUser!.uid)
          .collection(Util.CART_COLLECTION).doc(widget.dish!['docId']).set(cartDish.toMap());

    }

    deleteDishFromCart(){
      FirebaseFirestore.instance.collection(Util.USERS_COLLECTION)
          .doc(Util.appUser!.uid)
          .collection(Util.CART_COLLECTION).doc(widget.dish!['docId']).delete();
    }

    return Container(
      width: 140,
      height: 40,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          border: Border.all(color: Colors.black45)),
      child: (initialValue == 0)
          ? TextButton(
              onPressed: () {
                setState(() {
                  initialValue++;
                  updateDishInCart();
                });
              },
              child: Text("ADD",
                  style: TextStyle(color: Colors.black, fontSize: 16)))
          : Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                TextButton(
                  onPressed: () {
                    setState(() {
                      if (initialValue <= 0) {
                        initialValue = 0;
                        deleteDishFromCart();
                        // dish has to be deleted from cart
                      } else {
                        initialValue--;
                        updateDishInCart();
                      }

                    });
                  },
                  child: Text(
                    "-",
                    style: TextStyle(color: Colors.black, fontSize: 16),
                  ),
                ),
                Text(
                  initialValue.toString(),
                  style: TextStyle(color: Colors.black, fontSize: 16),
                ),
                TextButton(
                  onPressed: () {
                    setState(() {
                      initialValue++;
                      updateDishInCart();
                    });
                  },
                  child: Text(
                    "+",
                    style: TextStyle(color: Colors.black, fontSize: 16),
                  ),
                )
              ],
            ),
    );
  }
}
