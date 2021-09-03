import 'package:flutter/material.dart';

class SuccessPage extends StatefulWidget {

  String title;
  String message;
  bool flag;

  SuccessPage({Key? key, required this.title, required this.message, required this.flag}) : super(key: key);

  @override
  _SuccessPageState createState() => _SuccessPageState();
}

class _SuccessPageState extends State<SuccessPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          children: [
            widget.flag ? Icon(Icons.cloud_done, color: Colors.green,) : Icon(Icons.error_outline_sharp, color: Colors.red,),
            SizedBox(height: 12,),
            Text(widget.title),
            Divider(),
            Text(widget.message),
            InkWell(
              child: Text("HOME"),
              onTap: (){
                Navigator.pushReplacementNamed(context, "/");
              },
            )

          ],
        ),
      ),
    );
  }
}