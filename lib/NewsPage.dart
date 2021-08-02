import 'package:flutter/material.dart';
import 'dart:convert' as convert;
import 'package:http/http.dart' as http;


fetchNews() async{
  String apiKey = "31c21508fad64116acd229c10ac11e84";
  String url = "https://newsapi.org/v2/top-headlines?country=us&apiKey="+apiKey;

  var response = await http.get(Uri.parse(url));
  return response.body; // JSON DATA
}

class NewsPage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {

    String data = fetchNews();

    return Text(data);
  }
}

