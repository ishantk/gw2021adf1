import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:gw2021adf1/model/user.dart';
import 'package:gw2021adf1/util/constants.dart';
import 'package:http/http.dart';

// Will read data from Firebase or any other DataStore
class DataProvider extends ChangeNotifier{
  // Firebase Operations :)

  late FirebaseFirestore db;
  AppUser? appUser;

  StreamSubscription<QuerySnapshot<Map<String, dynamic>>>? restaurantsSubscription;
  List<QueryDocumentSnapshot<Map<String, dynamic>>>? restaurants;

  DataProvider(){
    db = FirebaseFirestore.instance;
    // we can also perform other operations
    getAppUser();
    fetchRestaurants();
  }

  getAppUser() async{
    User? user = FirebaseAuth.instance.currentUser;
    if(user != null) {
      DocumentSnapshot document = await FirebaseFirestore.instance.collection(
          Util.USERS_COLLECTION).doc(user.uid).get();

      appUser = AppUser();

      appUser!.uid = document.get('uid').toString();
      appUser!.name = document.get('name').toString();
      appUser!.email = document.get('email').toString();
      appUser!.imageUrl = document.get('imageUrl').toString();

    }

    return appUser;
  }

  fetchRestaurants(){
    // listen will observe for any data change in database and hence, the function will be re-executed to handle changes
    restaurantsSubscription = db.collection(Util.RESTAURNAT_COLLECTION).snapshots().listen((event) {
      // Printing the first record
      print("DATA: ${event.docs.first.data()}");
      restaurants = event.docs;
      notifyListeners();
    });

  }

  // Reference Reading on Design Pattern
  // https://en.wikipedia.org/wiki/Software_design_pattern
}