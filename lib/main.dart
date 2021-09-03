import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';

import 'package:flutter/material.dart';
import 'package:gw2021adf1/auth/login-page.dart';
import 'package:gw2021adf1/auth/register-page.dart';
import 'package:gw2021adf1/home/home-page.dart';
import 'package:gw2021adf1/home/splash-page.dart';
import 'package:gw2021adf1/pages/cart-page.dart';
import 'package:gw2021adf1/pages/payment-methods-page.dart';
import 'package:gw2021adf1/pages/razorpay-payment-page.dart';
import 'package:gw2021adf1/profile/user-addresses.dart';
import 'package:gw2021adf1/provider/DataProvider.dart';
import 'package:gw2021adf1/tutorials/NewsPage.dart';
import 'package:gw2021adf1/tutorials/data-passing.dart';
import 'package:gw2021adf1/tutorials/fetch-current-location.dart';
import 'package:gw2021adf1/tutorials/google-maps-with-location.dart';
import 'package:gw2021adf1/tutorials/image-picker-task.dart';
import 'package:gw2021adf1/util/constants.dart';
import 'package:provider/provider.dart';

Future<void> _firebaseMessagingBackgroundHandler(RemoteMessage message) async {
  //await Firebase.initializeApp();
  print('Handling a background message ${message.messageId}');
}

/// Create a [AndroidNotificationChannel] for heads up notifications
AndroidNotificationChannel? channel;

/// Initialize the [FlutterLocalNotificationsPlugin] package.
FlutterLocalNotificationsPlugin? flutterLocalNotificationsPlugin;


// main function represents main thread
// whatever we code in main, is executed by main thread
// that too in a sequence
Future<void> main() async{

  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  FirebaseMessaging.onBackgroundMessage(_firebaseMessagingBackgroundHandler);

  Locale.populateMap();

  // to execute the app created by us
  // MyApp -> Object
  //runApp(MyApp());

  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider(create: (context) => DataProvider(),)
    ],
    child: MyApp(), // For MyApp and all the widgets under the tree, we have DataProvider from where we can accrss the data
  ));

}



class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {

  @override
  void initState() {
    super.initState();

    FirebaseMessaging.instance
        .getInitialMessage()
        .then((RemoteMessage? message) {
          if (message != null) {
            // Navigator.pushNamed(context, '/message',
            //     arguments: MessageArguments(message, true));
          }
    });

    // For Sending notification to a particular user
    // Token must be saved in the DB
    /*FirebaseMessaging.instance.getToken().then((value){
      print("VALUE:"+value.toString());
      print("TYPE:"+value.runtimeType.toString());
    });*/

    // To send notification on some topic
    //FirebaseMessaging.instance.subscribeToTopic("healthy-tips");

    //FirebaseMessaging.instance.unsubscribeFromTopic("healthy-tips");


    FirebaseMessaging.onMessage.listen((RemoteMessage? message) {

      RemoteNotification? notification = message!.notification;
      AndroidNotification? android = message.notification!.android;

      if (notification != null && android != null && !kIsWeb) {
        flutterLocalNotificationsPlugin!.show(
            notification.hashCode,
            notification.title,
            notification.body,
            NotificationDetails(
              android: AndroidNotificationDetails(
                channel!.id,
                channel!.name,
                channel!.description,
                playSound: true,
                //sound: AndroidNotificationSound()
                // TODO add a proper drawable resource to android, for now using
                //      one that already exists in example app.
                icon: 'launch_background',
              ),
            ));
      }
    });

    FirebaseMessaging.onMessageOpenedApp.listen((RemoteMessage message) {
      print('A new onMessageOpenedApp event was published!');
      // Navigator.pushNamed(context, '/message',
      //     arguments: MessageArguments(message, true));
    });
  }

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
         AppRoutes.ADDRESS_PAGE_ROUTE:(context) => UserAddressesPage(),
         "/image-picker": (context) => ImagePickerPage(),
         "/cart": (context) => CartPage(),
         "/location-tutorial": (context) => FetchCurrentLocationPage(),
         "/google-maps-tutorial": (context) => GoogleMapsPage(),
         "/payment": (context) => PaymentMethodsPage(),
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
