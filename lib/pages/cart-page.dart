import 'package:flutter/material.dart';
import 'package:gw2021adf1/util/constants.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class CartPage extends StatefulWidget {
  const CartPage({Key? key}) : super(key: key);

  @override
  _CartPageState createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {

  int total = 0;

  fetchDishesFromCart(){
    // Stream is a Collection i.e. a List of QuerySnapshot
    // QuerySnapshot is our Document :)
    Stream<QuerySnapshot> stream = FirebaseFirestore.instance.collection(Util.USERS_COLLECTION)
        .doc(Util.appUser!.uid).collection(Util.CART_COLLECTION).snapshots();
    return stream;
  }



  @override
  Widget build(BuildContext context) {



    return Scaffold(
        appBar: AppBar(
          title: Text("CART"),
        ),
        body: StreamBuilder(
          stream: fetchDishesFromCart(),
          builder: (BuildContext context, AsyncSnapshot snapshot) {

            if(snapshot.hasError){
              return Center(
                child: Text("SOMETHING WENT WRONG", style: TextStyle(color: Colors.red),),
              );
            }

            if(snapshot.connectionState == ConnectionState.waiting){
              return Center(
                child: CircularProgressIndicator(),
              );
            }

            return ListView(
                padding: EdgeInsets.all(16),
                children: snapshot.data!.docs.map<Widget>((DocumentSnapshot document){
                  Map<String, dynamic> map = document.data()! as Map<String, dynamic>;

                  total += map['totalPrice'] as int;

                  return Card(
                    child: Container(
                      padding: EdgeInsets.all(16.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(map['name'], style: TextStyle(fontSize: 22),),
                          SizedBox(height: 5,),
                          Text("Price \u20b9"+map['price'].toString(), style: TextStyle(color: Colors.black54, fontSize: 18),),
                          SizedBox(height: 5,),
                          Text(map['quantity'].toString(), style: TextStyle(fontSize: 22),),
                          SizedBox(height: 5,),
                          Text(map['totalPrice'].toString(), style: TextStyle(fontSize: 22),),
                        ],
                      ),
                    ),
                  );
                }).toList()
            );
          },
        )
    );
  }

}
