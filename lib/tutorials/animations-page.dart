import 'package:flutter/material.dart';

Route getAnimatedRoute(Widget page){

  return PageRouteBuilder<SlideTransition>(
    // PageBuilder shall return the page on which we wish to navigate
      pageBuilder: (context, animation, secondaryAnimation) {
        return page;
      },
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        var tween = Tween<Offset>(begin: Offset(0.0, 1.0), end: Offset.zero);
        var curveTween = CurveTween(curve: Curves.ease);

        return SlideTransition(
            position: animation.drive(curveTween).drive(tween),
            child: child,
        );
      },
  );

}

class PageOne extends StatelessWidget {
  const PageOne({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("PAGE ONE"),
      ),
      body: Center(
        child: TextButton(
          child: Text("NAVIGATE TO PAGE TWO"),
          onPressed: (){
            Navigator.of(context).push(getAnimatedRoute(PageTwo()));
          },
        ),
      ),
    );
  }
}

class PageTwo extends StatelessWidget {
  const PageTwo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("PAGE TWO"),
      ),
      body: Center(
        child: Text("WELCOME TO PAGE TWO"),
        ),
    );
  }
}
