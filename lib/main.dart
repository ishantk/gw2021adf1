import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:gw2021adf1/auth/login-page.dart';
import 'package:gw2021adf1/auth/register-page.dart';
import 'package:gw2021adf1/home/home-page.dart';
import 'package:gw2021adf1/home/splash-page.dart';
import 'package:gw2021adf1/pages/cart-page.dart';
import 'package:gw2021adf1/tutorials/NewsPage.dart';
import 'package:gw2021adf1/tutorials/data-passing.dart';
import 'package:gw2021adf1/tutorials/fetch-current-location.dart';
import 'package:gw2021adf1/tutorials/image-picker-task.dart';
import 'package:gw2021adf1/util/constants.dart';

// main function represents main thread
// whatever we code in main, is executed by main thread
// that too in a sequence
Future<void> main() async{

  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  Locale.populateMap();

  // to execute the app created by us
  // MyApp -> Object
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
      ),
       routes: {
         "/": (context) => SplashPage(),
         "/home": (context) => HomePage(),
         "/news": (context) => NewsPage(),
         "/one": (context) => PageOne(),
         "/two": (context) => PageTwo(),
         "/login": (context) => LoginPage(),
         "/register": (context) => RegisterUserPage(),
         "/image-picker": (context) => ImagePickerPage(),
         "/cart": (context) => CartPage(),
         "/location-tutorial": (context) => FetchCurrentLocationPage(),
       },

      initialRoute: "/",
    );
  }
}

/*
class HomePage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("My App"),
      ),
      body: NewsPage(),
    );
  }
}
*/
