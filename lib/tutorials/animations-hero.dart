import 'package:flutter/material.dart';

class HeroPageOne extends StatelessWidget {
  const HeroPageOne({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("HERO PAGE ONE"),
      ),
      body: Container(
        child: InkWell(
          child: Hero(
            child: Image.network("https://firebasestorage.googleapis.com/v0/b/gw2021fb1.appspot.com/o/dishes%2Fsalad.jpg?alt=media&token=540f7204-bacc-4833-96a7-a116a79e20d1"),
            tag: "my-tag",
          ),
          onTap: (){
            Navigator.push(context, 
            MaterialPageRoute(builder: (context) => HeroPageTwo(),));
          },
        ),
      ),
    );
  }
}

class HeroPageTwo extends StatelessWidget {
  const HeroPageTwo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("HERO PAGE ONE"),
      ),
      body: Center(
        child: InkWell(
          child: Hero(
            tag: "my-tag",
            child: Image.network("https://firebasestorage.googleapis.com/v0/b/gw2021fb1.appspot.com/o/dishes%2Fsalad.jpg?alt=media&token=540f7204-bacc-4833-96a7-a116a79e20d1"),
          ),
          
          onTap: (){
            Navigator.pop(context);
          },
        ),
      ),
    );
  }
}
