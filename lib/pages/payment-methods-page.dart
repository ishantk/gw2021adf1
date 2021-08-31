import 'package:flutter/material.dart';
import 'package:gw2021adf1/util/constants.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class PaymentMethodsPage extends StatefulWidget {
  const PaymentMethodsPage({Key? key}) : super(key: key);

  @override
  _PaymentMethodsPageState createState() => _PaymentMethodsPageState();
}

class _PaymentMethodsPageState extends State<PaymentMethodsPage> {
  fetchPaymentMethods() async{

    bool result = await Util.isInternetConnected();

    if(result) {
      // Stream is a Collection i.e. a List of QuerySnapshot
      // QuerySnapshot is our Document :)
      Stream<QuerySnapshot> stream = FirebaseFirestore.instance.collection(
          Util.EXTRA_COLLECTION)
          .doc('payment-methods').collection('methods').snapshots();
      return stream;
    }else{
      // show the AlertDialog or some UI that internet is not connected
    }
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("PAYMENT METHODS"),
        ),
        body: StreamBuilder(
          stream: fetchPaymentMethods(),
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

                  return ListTile(
                    leading: Icon(Icons.payment),
                    title: Text(map['name'], style: TextStyle(fontSize: 22),),
                    trailing: Icon(Icons.keyboard_arrow_right),
                    onTap: (){
                      Navigator.pop(context);
                    },
                  );
                }).toList()
            );
          },
        )
    );
  }
}
