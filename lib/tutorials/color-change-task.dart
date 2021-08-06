import 'package:flutter/material.dart';

final Color orange = Color.fromARGB(255, 194, 112, 34);

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: ColorChange()
    );
  }
}

class ColorChange extends StatefulWidget {
  const ColorChange({Key? key}) : super(key: key);

  @override
  _ColorChangeState createState() => _ColorChangeState();
}

class _ColorChangeState extends State<ColorChange> {

  var backgroundColors = <String, List<Color>>{
    "Black": [Colors.black45, Colors.black],
    "Orange": [Colors.orangeAccent, Colors.orange],
    "Green": [Colors.greenAccent, Colors.green],
    "Blue": [Colors.blueAccent, Colors.blue],
    "Amber": [Colors.amberAccent, Colors.amber],
    "Red": [Colors.redAccent, Colors.red],
  };

  Color backgroundColor = Colors.cyanAccent;
  Color appBarBackgroundColor = Colors.cyan;

  getWidgets(){
    var widgets = <Widget>[];
    backgroundColors.forEach((key, value) {
      widgets.add(InkWell(
        child: Text(key, style: TextStyle(color: Colors.white, fontSize: 24),),
        onTap: (){
          setState(() {
            backgroundColor = value[0];
            appBarBackgroundColor = value[1];
          });
        },
      ));
      widgets.add(Divider());
    });
    return widgets;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      appBar: AppBar(
        title: Text("My APP"),
        backgroundColor: appBarBackgroundColor,
      ),
      body: ListView(
          children: getWidgets()
      ),
    );
  }
}
