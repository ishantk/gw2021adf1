import 'package:flutter/material.dart';

class Counter extends StatefulWidget {
  const Counter({Key? key}) : super(key: key);

  @override
  _CounterState createState() => _CounterState();
}

class _CounterState extends State<Counter> {

  int initialValue = 0;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 140,
      height: 40,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          border: Border.all(color: Colors.black45)),
      child: (initialValue == 0)
          ? TextButton(
              onPressed: () {
                setState(() {
                  initialValue++;
                });
              },
              child: Text("ADD",
                  style: TextStyle(color: Colors.black, fontSize: 16)))
          : Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                TextButton(
                  onPressed: () {
                    setState(() {
                      if (initialValue <= 0) {
                        initialValue = 0;
                      } else {
                        initialValue--;
                      }
                    });
                  },
                  child: Text(
                    "-",
                    style: TextStyle(color: Colors.black, fontSize: 16),
                  ),
                ),
                Text(
                  initialValue.toString(),
                  style: TextStyle(color: Colors.black, fontSize: 16),
                ),
                TextButton(
                  onPressed: () {
                    setState(() {
                      initialValue++;
                    });
                  },
                  child: Text(
                    "+",
                    style: TextStyle(color: Colors.black, fontSize: 16),
                  ),
                )
              ],
            ),
    );
  }
}
