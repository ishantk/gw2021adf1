import 'package:cloud_firestore/cloud_firestore.dart';

class AppUser{

  String? uid;
  String? name;
  String? email;
  String? imageUrl;
  GeoPoint? currentLocation; // Use this to Updatde Current Location of User

  AppUser({this.uid, this.name, this.email});

  @override
  String toString() {
    return 'User{uid: $uid, name: $name, email: $email, imageUrl: $imageUrl}';
  }

  Map<String, dynamic> toMap(){
     return {
      "uid": uid,
      "name": name,
      "email": email,
       "imageUrl": "",
    };

  }
}