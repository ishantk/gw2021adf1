import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:gw2021adf1/model/user.dart';

// final String APP_NAME = "Foodie";
// final String USERS_COLLECTION = "users";
// final String RESTAURNAT_COLLECTION = "restaurants";
// final String DISHES_COLLECTION = "dishes";
// AppUser? user;

class Util {

  static fetchUserDetails() async{
    String uid = await FirebaseAuth.instance.currentUser!.uid.toString();
    if(uid != null) {
      DocumentSnapshot document = await FirebaseFirestore.instance.collection(
          Util.USERS_COLLECTION).doc(uid).get();

      Util.appUser = AppUser();

      Util.appUser!.uid = document.get('uid').toString();
      Util.appUser!.name = document.get('name').toString();
      Util.appUser!.email = document.get('email').toString();
      Util.appUser!.imageUrl = document.get('imageUrl').toString();
    }

    /*Util.appUser!.isAdmin = document.get('isAdmin') as Boolean;
    if(Util.appUser!.isAdmin){
      navigateToAdminHome();
    }else{
      navigateToUserHome();
    }*/
  }

  static String APP_NAME = "Foodie";
  static String USERS_COLLECTION = "users";
  static String RESTAURNAT_COLLECTION = "restaurants";
  static String DISHES_COLLECTION = "dishes";
  static String CART_COLLECTION = "cart";
  static AppUser? appUser;

  static String imagePath = "NA";
}

class Locale{

  static populateMap(){
    englishLocaleMap['appTitle'] = "Foodie";
    englishLocaleMap['register'] = "Register";

    hindiLocaleMap['appTitle'] = "खाने का शौकीन";
    hindiLocaleMap['register'] = "रजिस्टर करें";
  }

  static Map<String, String> englishLocaleMap = new Map<String, String>();
  static Map<String, String> hindiLocaleMap = new Map<String, String>();
  static int localeType = 2;
  static Map<String, String> locale = hindiLocaleMap;
}

