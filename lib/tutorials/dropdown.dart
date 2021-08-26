import 'package:flutter/material.dart';

class DropDownPage extends StatefulWidget {
  const DropDownPage({Key? key}) : super(key: key);

  @override
  _DropDownPageState createState() => _DropDownPageState();
}

getDropDownItems(){
  return ["Select City", "Ludhiana", "Chandigarh", "Delhi", "Bangalore", "Santa Clara"].map((String city) {
    return DropdownMenuItem(child: Text(city), value: city,);
  }).toList();

}

class _DropDownPageState extends State<DropDownPage> {

  String value = "Select City";

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
        appBar: AppBar(
        title: Text("DropDown Tutorial"),
    ),
    body: Center(
      child: DropdownButton(
        icon: Icon(Icons.keyboard_arrow_down_sharp),
        iconSize: 24.0,
        underline: Container(
          height: 2.0,
          color: Colors.white,
        ),
        items: getDropDownItems(),
        value: value,
        onChanged: (newValue) {
          setState(() {
            value = newValue as String;
          });
        },
      )
      )
    );
  }
}
