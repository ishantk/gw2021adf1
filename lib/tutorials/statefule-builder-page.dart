import 'package:flutter/material.dart';

class StatefulBuilderDemo extends StatefulWidget {
  const StatefulBuilderDemo({Key? key}) : super(key: key);

  @override
  _StatefulBuilderDemoState createState() => _StatefulBuilderDemoState();
}

class _StatefulBuilderDemoState extends State<StatefulBuilderDemo> {

  String text = "This is Awesome";

  @override
  Widget build(BuildContext context) {
    return Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,

        children: [
          Text(text),
          SizedBox(height: 8,),
          StatefulBuilder(
            builder: (context, setState) {
              return Column(
                children: [
                  Text(text),
                  SizedBox(height: 8,),
                  OutlinedButton(onPressed: (){
                    setState(() {
                      text = "This has been changed. Wow :)";
                    });
                  }, child: Text("Click to Change"))
                ],
              );
            },
          ),
        ],
    );
  }
}
