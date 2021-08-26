import 'package:flutter/material.dart';

class BannerPage extends StatefulWidget {
  const BannerPage({Key? key}) : super(key: key);

  @override
  _BannerPageState createState() => _BannerPageState();
}

class _BannerPageState extends State<BannerPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Banner Tutorial"),
      ),
      body: MaterialBanner(
        content: Text("Welcome to Foodie App. We got New Offers for You"),
        leading: CircleAvatar(
          child: Icon(Icons.notifications_active_outlined),
        ),
        actions: [
          TextButton(onPressed: (){

          }, child: Text("DONE")
          ),
          TextButton(onPressed: (){

          }, child: Text("ORDER NOW")
          ),
        ],
      ),
    );
  }
}
