import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:gw2021adf1/pages/restaurants-page.dart';
import 'package:gw2021adf1/profile/user-profile.dart';
import 'package:gw2021adf1/util/constants.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  int index = 0;

  List<Widget> widgets = [
    RestaurantsPage(),
    Center(child: Text("SEARCH PAGE")),
    UserProfilePage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: AppBar(
        title: Text("Foodie"),
        actions: [
          IconButton(
            onPressed: (){
              Navigator.pushReplacementNamed(context, "/cart");
            }, icon: Icon(Icons.shopping_cart),
            tooltip: "Cart",

          ),
          IconButton(
              onPressed: (){
                Util.appUser = null;
                FirebaseAuth.instance.signOut();
                Navigator.pushReplacementNamed(context, "/login");
          }, icon: Icon(Icons.logout),
            tooltip: "Log Out",

          )
        ],
      ),

      body: widgets[index],

      bottomNavigationBar: BottomNavigationBar(
        items: [
          // 0
          BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: "HOME"
          ),
          // 1
          BottomNavigationBarItem(
              icon: Icon(Icons.search),
              label: "SEARCH"
          ),
          //2
          BottomNavigationBarItem(
              icon: Icon(Icons.account_box),
              label: "PROFILE"
          )
        ],

        currentIndex: index,
        selectedFontSize: 16,
        selectedItemColor: Colors.deepOrange,
        onTap: (idx){ // idx will have value of the index of BottomNavBarItem
          setState(() {
            index = idx;
          });
        },
      ),

    );
  }
}
