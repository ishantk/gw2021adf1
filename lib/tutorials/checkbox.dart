import 'package:flutter/material.dart';

class CheckBoxPage extends StatefulWidget {
  const CheckBoxPage({Key? key}) : super(key: key);

  @override
  _CheckBoxPageState createState() => _CheckBoxPageState();
}

class _CheckBoxPageState extends State<CheckBoxPage> {

  bool isChecked = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
        title: Text("CheckBox Tutorial"),
    ),
      body: Center(
        child: CheckboxListTile(
            title: Text("Java"),
            subtitle: Text("Java and JEE Technology"),
            value: isChecked,
            onChanged: (value) {
              setState(() {
                isChecked = value as bool;
              });
            },
        ),
      ),
    );
  }
}
