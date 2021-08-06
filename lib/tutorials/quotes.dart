import 'package:flutter/material.dart';



class QuotesPage extends StatefulWidget {
  const QuotesPage({Key? key}) : super(key: key);

  @override
  /*_QuotesPageState createState(){
    return _QuotesPageState();
  }*/

  _QuotesPageState createState() => _QuotesPageState();

}

class _QuotesPageState extends State<QuotesPage> {

  var quotes = [
    "Be Exceptional",
    "Work hard, and Succeed",
    "Search the candle rather than cursing the darkness",
    "Always Smile and be Happy"
  ];

  var idx = 0;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(quotes[idx]),
          SizedBox(height: 100,),
          Divider(),
          InkWell(
            child: Text("Next Quote"),
            onTap: (){
              setState( () {
                if(idx == quotes.length){
                 idx = 0;
                }else {
                  idx++;
                }
              });
            },
          ),
          Divider(),
        ],
      ),
    );
  }
}

class _QuotesPageAnotherState extends State<QuotesPage> {

  var quotes = [
    "Be Exceptional",
    "Work hard, and Succeed",
    "Search the candle rather than cursing the darkness",
    "Always Smile and be Happy"
  ];

  getTextWidgets(){
    var textWidgets = <Widget>[];
    quotes.forEach((element) {
      textWidgets.add(Text(element));
      textWidgets.add(Divider());
    });
    return textWidgets;
  }

  @override
  Widget build(BuildContext context) {

    // return Column(
    //   mainAxisAlignment: MainAxisAlignment.center,
    //   crossAxisAlignment: CrossAxisAlignment.center,
    //   children: getTextWidgets(),
    // );

    return ListView(
      children: getTextWidgets()
    );
  }
}
