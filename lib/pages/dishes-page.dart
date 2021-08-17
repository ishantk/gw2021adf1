import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:gw2021adf1/custom-widgets/counter.dart';
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
    return Scaffold(
      appBar: AppBar(
        title: Text(APP_NAME),
      ),
      body: StreamBuilder(
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
            padding: EdgeInsets.all(16),
              children: snapshot.data!.docs.map<Widget>((DocumentSnapshot document){
                //document.id -> Restaurant Document ID
                Map<String, dynamic> map = document.data()! as Map<String, dynamic>;

                List category = map['category'];
                String categories = "";
                category.forEach((element) {
                  categories += element.toString()+", ";
                });

                categories = categories.substring(0, categories.length-2);

                return Card(
                  child: Container(
                    padding: EdgeInsets.all(16.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Image.network(map['imageUrl'].toString()),
                        SizedBox(height: 10,),
                        Text(map['name'], style: TextStyle(fontSize: 22),),
                        Row(
                          children:[
                            Text("Price \u20b9"+map['price'].toString(), style: TextStyle(color: Colors.black54, fontSize: 18),),
                            Spacer(),
                            Container(
                              padding: EdgeInsets.all(6.0),
                              child: Text(map['ratings'].toString(), style: TextStyle(color: Colors.white),),
                              decoration: BoxDecoration(
                                  color: Colors.green,
                                  borderRadius: BorderRadius.circular(8.0)
                              ),
                            ),
                            ]
                        ),
                        Text(categories, style: TextStyle(fontSize: 16, color: Colors.black45),),
                        Divider(),
                        Row(
                          children: [
                            Spacer(),
                            Counter(),
                          ],
                        ),
                        SizedBox(height: 10,)
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
