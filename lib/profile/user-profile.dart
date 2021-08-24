import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:gw2021adf1/model/user.dart';
import 'package:gw2021adf1/util/constants.dart';

class UserProfilePage extends StatefulWidget {
  const UserProfilePage({Key? key}) : super(key: key);

  @override
  _UserProfilePageState createState() => _UserProfilePageState();
}

class _UserProfilePageState extends State<UserProfilePage> {

  /*AppUser? appUser;

  fetchUserDetails() async{
    String uid = await FirebaseAuth.instance.currentUser!.uid.toString();  
    DocumentSnapshot document = await FirebaseFirestore.instance.collection(Util.USERS_COLLECTION).doc(uid).get();
    appUser = AppUser();

    appUser!.uid = document.get('uid').toString();
    appUser!.name = document.get('name').toString();
    appUser!.email = document.get('email').toString();
    appUser!.imageUrl = document.get('imageUrl').toString();
  }*/
  
  @override
  Widget build(BuildContext context) {

    //return FutureBuilder(builder: builder, future: fetchUserDetails(),)

    return ListView(
        padding: EdgeInsets.all(16),
        children: [
          Card(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Padding(padding: EdgeInsets.all(8)),
                InkWell(
                  child: CircleAvatar(
                    backgroundImage: NetworkImage(Util.appUser!.imageUrl.toString()),
                    radius: 60,
                  ),
                  onTap: (){
                    // image picker logic goes here
                  },
                ),
                Padding(padding: EdgeInsets.all(8)),
                Divider(),
                Text(Util.appUser!.name.toString(), style: TextStyle(color: Colors.blueGrey, fontSize: 20),),
                Text(Util.appUser!.email.toString(), style: TextStyle(color: Colors.black38, fontSize: 18),)
              ],
            ),
          ),
          ListTile(
            leading: Icon(Icons.person),
            title: Text("Manage Profile"),
            subtitle: Text("Update Your Data for Your Account"),
            trailing: Icon(Icons.keyboard_arrow_right_sharp),
            onTap: (){

            },
          ),
          ListTile(
            leading: Icon(Icons.shopping_cart),
            title: Text("Manage Orders"),
            subtitle: Text("Manage Your Order History Here"),
            trailing: Icon(Icons.keyboard_arrow_right_sharp),
            onTap: (){

            },
          ),
          ListTile(
            leading: Icon(Icons.home),
            title: Text("Manage Addresses"),
            subtitle: Text("Update Your Addresses for Delivery"),
            trailing: Icon(Icons.keyboard_arrow_right_sharp),
            onTap: (){
              Navigator.pushNamed(context, AppRoutes.ADDRESS_PAGE_ROUTE);
            },
          ),
          ListTile(
            leading: Icon(Icons.message),
            title: Text("Help"),
            subtitle: Text("Raise Your Queries"),
            trailing: Icon(Icons.keyboard_arrow_right_sharp),
            onTap: (){
                
            },
          ),
          ListTile(
            leading: Icon(Icons.document_scanner_outlined),
            title: Text("Terms & Conditions"),
            subtitle: Text("Check our Terms and Conditions"),
            trailing: Icon(Icons.keyboard_arrow_right_sharp),
            onTap: (){

            },
          ),
        ],
      );
  }
}
