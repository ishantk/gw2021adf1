import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:gw2021adf1/model/user.dart';
import 'package:connectivity/connectivity.dart';

// final String APP_NAME = "Foodie";
// final String USERS_COLLECTION = "users";
// final String RESTAURNAT_COLLECTION = "restaurants";
// final String DISHES_COLLECTION = "dishes";
// AppUser? user;

class Util {

  static Future<bool> isInternetConnected() async{
    var connectivityResult = await (Connectivity().checkConnectivity());
    return connectivityResult == ConnectivityResult.mobile || connectivityResult == ConnectivityResult.wifi;
  }

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
  static String EXTRA_COLLECTION = "extras";
  static String ORDER_COLLECTION = "orders";
  
  static AppUser? appUser;

  static String imagePath = "NA";

  // Tags can also be read from Firebase
  // Hard Coding
  static const TAGS = ["all", "indian", "veg", "non veg", "chinese", "continental"];
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

class AppRoutes{
  static final String ADDRESS_PAGE_ROUTE = "/addresses";
}

