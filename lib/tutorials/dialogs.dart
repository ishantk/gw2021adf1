import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class AlertDialogPage extends StatefulWidget {
  const AlertDialogPage({Key? key}) : super(key: key);

  @override
  _AlertDialogPageState createState() => _AlertDialogPageState();
}

class _AlertDialogPageState extends State<AlertDialogPage>{

  @override
  Widget build(BuildContext context) {
    return Center(
      child: TextButton(
        child: Text("CLICK TO OPEN DIALOG"),
        onPressed: () async{
          // showDialog must be executed from async function
          return showDialog(
            // now dialog becomes non cancelable
            // i.e. we cannot click outside thedialog to dismiss it
              barrierDismissible: false,
              context: context,
              builder: (context) {
                return AlertDialog(
                  title: Text("This is title"),
                  content: Column(
                    children: [
                      Text("Are You Sure ?"),
                      SizedBox(height: 4.0,),
                      Text("Delete User ?"),
                    ],
                  ),
                  actions: [
                    TextButton(onPressed: (){
                      // execute the logic :)
                    }, child: Text("DELETE")),

                    TextButton(onPressed: (){
                      Navigator.of(context).pop();
                    }, child: Text("CANCEL"))
                  ],
                );
              },
          );
        },
      ),
    );
  }
}

// DatePicker and TimePicker

class DatePrickerDialogPage extends StatefulWidget {
  const DatePrickerDialogPage({Key? key}) : super(key: key);

  @override
  _DatePrickerDialogPageState createState() => _DatePrickerDialogPageState();
}

class _DatePrickerDialogPageState extends State<DatePrickerDialogPage> {
  @override
  Widget build(BuildContext context) {

    return Container();
    /*
    return  Center(
        child: TextButton(
        child: Text("CLICK TO OPEN DIALOG"),
        onPressed: () async{
          return showDatePicker(
              context: context,
              initialDate: initialDate,
              firstDate: firstDate,
              lastDate: lastDate,
              builder: (context, child) {

              },
          );
        }
    )
    );
    */
  }
}

