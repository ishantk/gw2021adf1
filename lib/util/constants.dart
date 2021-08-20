import 'package:gw2021adf1/model/user.dart';

// final String APP_NAME = "Foodie";
// final String USERS_COLLECTION = "users";
// final String RESTAURNAT_COLLECTION = "restaurants";
// final String DISHES_COLLECTION = "dishes";
// AppUser? user;

class Util {
  static String APP_NAME = "Foodie";
  static String USERS_COLLECTION = "users";
  static String RESTAURNAT_COLLECTION = "restaurants";
  static String DISHES_COLLECTION = "dishes";
  static String CART_COLLECTION = "cart";
  static AppUser? appUser;
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

