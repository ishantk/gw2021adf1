import 'package:flutter/material.dart';

class Counter extends StatefulWidget {
  const Counter({Key? key}) : super(key: key);

  @override
  _CounterState createState() => _CounterState();
}

class _CounterState extends State<Counter> {

  int initialValue=1;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        shape: BoxShape.rectangle,
        color: Colors.grey
      ),
      child: Row(
        children: [
          TextButton(onPressed: (){
            setState(() {
              if(initialValue <= 0) {
                initialValue = 0;
              }else{
                initialValue--;
              }
            });
          }, child: Text("-", style: TextStyle(color: Colors.black, fontSize: 16),),
          ),
          Text(initialValue.toString(), style: TextStyle(color: Colors.black, fontSize: 16),),
          TextButton(onPressed: (){
            setState(() {
              initialValue++;
            });
          }, child: Text("+", style: TextStyle(color: Colors.black, fontSize: 16),),
          )
        ],
      ),
    );
  }
}
