import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:gw2021adf1/home/home-page.dart';
import 'package:gw2021adf1/model/user.dart';
import 'package:gw2021adf1/util/constants.dart';


class SplashPage extends StatefulWidget {
  const SplashPage({Key? key}) : super(key: key);

  @override
  _SplashPageState createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {

  tutorialNavigation(BuildContext context) async{
    Future.delayed(
        Duration(seconds: 3),
            (){
           Navigator.pushNamed(context, "/google-maps-tutorial");
        }
    );
  }

  navigateToHome(BuildContext context) async{

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

    //navigateToHome(context);
    //Util.fetchUserDetails();
    tutorialNavigation(context);

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

