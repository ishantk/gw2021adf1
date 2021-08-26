import 'package:flutter/material.dart';

// named constants
enum Gender{
  male,
  female,
  others
}

class RadioButtonPage extends StatefulWidget {
  const RadioButtonPage({Key? key}) : super(key: key);

  @override
  _RadioButtonPageState createState() => _RadioButtonPageState();
}

class _RadioButtonPageState extends State<RadioButtonPage> {

  Gender groupValue = Gender.male;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
        title: Text("CheckBox Tutorial"),
    ),
    body: Column(
      children: [
        RadioListTile(
            value: Gender.male,
            groupValue: groupValue,
            onChanged: (value) {
              setState(() {
                groupValue = Gender.male;
              });
            },
            title: Text("Male"),
        ),
        RadioListTile(
          value: Gender.female,
          groupValue: groupValue,
          onChanged: (value) {
            setState(() {
              groupValue = Gender.female;
            });
          },
          title: Text("Female"),
        ),
        RadioListTile(
          value: Gender.others,
          groupValue: groupValue,
          onChanged: (value) {
            setState(() {
              groupValue = Gender.others;
            });
          },
          title: Text("Others"),
        )
      ],
    )
    );
  }
}
