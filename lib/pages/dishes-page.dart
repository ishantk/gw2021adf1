import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:gw2021adf1/util/constants.dart';

class DishesPage extends StatefulWidget {

  String? restaurantId;

  DishesPage({Key? key, this.restaurantId}) : super(key: key);

  @override
  _DishesPageState createState() => _DishesPageState();
}

class _DishesPageState extends State<DishesPage> {

  fetchRestaurants(){
    // Stream is a Collection i.e. a List of QuerySnapshot
    // QuerySnapshot is our Document :)
    Stream<QuerySnapshot> stream = FirebaseFirestore.instance.collection(RESTAURNAT_COLLECTION)
    .doc(widget.restaurantId).collection(DISHES_COLLECTION).snapshots();
    return stream;
  }


  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: fetchRestaurants(),
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
            children: snapshot.data!.docs.map<Widget>((DocumentSnapshot document){
              //document.id -> Restaurant Document ID
              Map<String, dynamic> map = document.data()! as Map<String, dynamic>;
              return ListTile(
                title: Text(map['name']),
                subtitle: Text(map['price'].toString()),
                onTap: (){
                  // Navigate to another page where we will display dishes
                  // + 1 - -> Develop Counter Widget on UI
                },
              );
            }).toList()
        );

      },

    );
  }
}
