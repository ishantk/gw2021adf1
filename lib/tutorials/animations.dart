/*
    Animations in Flutter
      When we wish to enrich user experience

      We now always have to create Stateful Widgets

      Animation
        We use Animation to animate any widget
        animation has states
          start, stop, move, forward, reverse

     AnimationController
        manage the animation

     Tween
      when we wish to change colors for some View eg: white -> yellow

     CurvedAnimation
      non linear animation

     Listener
      monitor states of Animation and can perform some task accordingly

     Explicit Animations
      As a developer we create animations
        Animation
        AnimationController
        Curve
        .
        ...

     Implicit Animations
      Already we have the classes which performs animations
        Container -> AnimatedContainer
        Padding -> AnimatedPadding
        Opacity -> AnimatedOpacity
        .
        ..
        ....

     Lottie
      https://lottiefiles.com/
      Download the JSON, gif or MP4 to use it in the app

    Hero Animation
      Where one widget is common in 2 different pages
      keeping the widget central, we can manage some effects
    Widget -> Hero

    StaggeredAnimation
      Stack of Animations, Overlapping

    .
    ...
    ....

 */

import 'dart:math';

import 'package:flutter/material.dart';

class AnimationPage extends StatefulWidget {
  const AnimationPage({Key? key}) : super(key: key);

  @override
  _AnimationPageState createState() => _AnimationPageState();
}

class _AnimationPageState extends State<AnimationPage> {

  Color color = Colors.green;
  double borderRadius = 1;
  double margin = 1;

  void updateAttributes(){
    // Generating Random Colors :)
    color = Color(0xFFFFFFFF & Random().nextInt(0xFFFFFFFF));
    borderRadius = Random().nextDouble() * 64;
    margin = Random().nextDouble() * 64;
  }

  // Acting as a Constructor
  // execute before the build method
  @override
  void initState(){
    super.initState();
    updateAttributes();
  }

  void animateContainer(){
    setState(() {
      updateAttributes();
    });
  }

  // Acting as a Destructor
  // When this widget will be deleted from memory
  // i.e. When we pop up the widget from the UI
  @override
  void dispose(){
    super.dispose();

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Animations Introduction"),
      ),

      body: Center(
        child: Column(
          children: [
            AnimatedContainer(
                width: 256,
                height: 256,
                margin: EdgeInsets.all(margin),
                duration: Duration(milliseconds: 1000),
                decoration: BoxDecoration(
                  color: color,
                  borderRadius: BorderRadius.circular(borderRadius)
                ),
            ),
            SizedBox(height: 24,),
            TextButton(
                onPressed: (){
                  animateContainer();
            }, child: Text("ANIMATE CONTAINER"))
          ],
        ),
      ),
    );
  }
}
