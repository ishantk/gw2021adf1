import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:gw2021adf1/home/home-page.dart';
import 'package:gw2021adf1/model/user.dart';
import 'package:gw2021adf1/util/constants.dart';

class SplashPage extends StatelessWidget {

  fetchUserDetails() async{
    String uid = await FirebaseAuth.instance.currentUser!.uid.toString();
    DocumentSnapshot document = await FirebaseFirestore.instance.collection(Util.USERS_COLLECTION).doc(uid).get();
    Util.appUser = AppUser();

    Util.appUser!.uid = document.get('uid').toString();
    Util.appUser!.name = document.get('name').toString();
    Util.appUser!.email = document.get('email').toString();
    Util.appUser!.imageUrl = document.get('imageUrl').toString();
  }

  navigateToHome(BuildContext context) async{

    //Navigator.pushNamed(context, "/image-picker");


    User? user = FirebaseAuth.instance.currentUser;
    /*
      Fetch the Details of User and save the details for reference created in constants.dart
     */

    //String uid = FirebaseAuth.instance.currentUser!.uid;

    Future.delayed(
        Duration(seconds: 3),
        (){
          //Navigator.pushNamed(context, "/home");
          if(user != null){
            Navigator.pushReplacementNamed(context, "/home");
          }else {
            Navigator.pushReplacementNamed(context, "/login");
          }
        }
    );
  }

  @override
  Widget build(BuildContext context) {


    navigateToHome(context);
    fetchUserDetails();

    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.asset("food.png"),
            SizedBox(height: 8,),
            Text(Util.APP_NAME, style: TextStyle(color: Colors.deepOrange, fontSize: 24),),
            Divider(),
            SizedBox(height: 4,),
            Text("We Deliver Fresh", style: TextStyle(color: Colors.grey, fontSize: 18))
          ],
        ),
      ),
    );
  }
}
