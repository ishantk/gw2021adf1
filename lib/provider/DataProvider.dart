import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

// Will read data from Firebase or any other DataStore
class DataProvider extends ChangeNotifier{
  // Firebase Operations :)

  late FirebaseFirestore db;

  // Subscription Model :)

  DataProvider(){
    db = FirebaseFirestore.instance;
  }

}