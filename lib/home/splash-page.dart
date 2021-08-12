import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:gw2021adf1/home/home-page.dart';

class SplashPage extends StatelessWidget {

  navigateToHome(BuildContext context){

    String uid = FirebaseAuth.instance.currentUser!.uid;

    Future.delayed(
        Duration(seconds: 3),
        (){
          //Navigator.pushNamed(context, "/home");
          if(uid.isNotEmpty){
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

    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.asset("food.png"),
            SizedBox(height: 8,),
            Text("Foodie", style: TextStyle(color: Colors.deepOrange, fontSize: 24),),
            Divider(),
            SizedBox(height: 4,),
            Text("We Deliver Fresh", style: TextStyle(color: Colors.grey, fontSize: 18))
          ],
        ),
      ),
    );
  }
}
