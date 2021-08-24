import 'package:flutter/material.dart';

class UserAddressesPage extends StatefulWidget {
  const UserAddressesPage({Key? key}) : super(key: key);

  @override
  _UserAddressesPageState createState() => _UserAddressesPageState();
}

class _UserAddressesPageState extends State<UserAddressesPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Addresses"),
      ),
      //body: StreamBuilder(),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.green,
        child: Icon(Icons.mail_outline, color: Colors.white,),
        onPressed: (){
          // Open up a UI to Add Address
        },
      ),
    );
  }
}
