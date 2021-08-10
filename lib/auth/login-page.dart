import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Column(
            children: [
              Container(
                height: MediaQuery.of(context).size.height/2,
                decoration: BoxDecoration(
                    gradient: LinearGradient(
                        begin: Alignment.bottomCenter,
                        end: Alignment.topCenter,
                        colors: <Color>[
                          //Color(0xff78e736)
                          Colors.green,
                          Colors.greenAccent,
                        ],
                        tileMode: TileMode.clamp
                    )
                ),
              ),
              Container(
                color: Colors.white,
                height: MediaQuery.of(context).size.height/2,
              )
            ],
          ),
          Align(
            alignment: Alignment.center,
            child: Card(
              color: Colors.white,
              margin: EdgeInsets.all(16),
              child: Column(
                children: [
                  TextField(
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.blueGrey
                    ),
                    decoration: InputDecoration(
                      filled: true,
                      alignLabelWithHint: true,
                      labelText: "Email ID",
                      labelStyle: TextStyle(color: Colors.green),
                      border: UnderlineInputBorder(
                        borderRadius: BorderRadius.circular(4),
                        borderSide: BorderSide(
                          width: 1,
                          style: BorderStyle.solid,
                          color: Colors.blueGrey
                        )
                      )

                    ),
                  ),
                  SizedBox(height: 6,),
                  TextField(
                    obscureText: true,
                    style: TextStyle(
                        fontSize: 16,
                        color: Colors.blueGrey
                    ),
                    decoration: InputDecoration(
                        filled: true,
                        alignLabelWithHint: true,
                        labelText: "Password",
                        labelStyle: TextStyle(color: Colors.green),
                        border: UnderlineInputBorder(
                            borderRadius: BorderRadius.circular(4),
                            borderSide: BorderSide(
                                width: 1,
                                style: BorderStyle.solid,
                                color: Colors.blueGrey
                            )
                        )

                    ),
                  ),
                  SizedBox(height: 6,),
                  ElevatedButton(
                    child: Text("LOGIN"),
                    onPressed: (){

                    },
                  )
                ],
              ),
            ),
          )
        ]

      ),
    );
  }
}
