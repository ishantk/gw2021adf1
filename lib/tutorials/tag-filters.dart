import 'package:flutter/material.dart';
import 'package:gw2021adf1/util/constants.dart';

class RestaurantFilters extends StatefulWidget {
  const RestaurantFilters({Key? key}) : super(key: key);

  @override
  _RestaurantFiltersState createState() => _RestaurantFiltersState();
}

class _RestaurantFiltersState extends State<RestaurantFilters> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 80,
      padding: EdgeInsets.all(16),
      child: ListView(
        shrinkWrap: true,
        scrollDirection: Axis.horizontal,
        children: [
          OutlinedButton(
            child: Text(Util.TAGS[0]),
            onPressed: (){

            },
          ),
          OutlinedButton(
            child: Text(Util.TAGS[1]),
            onPressed: (){

            },
          ),
          OutlinedButton(
            style: ButtonStyle(
              foregroundColor: MaterialStateProperty.resolveWith((states) => Colors.white),
            ),
            child: Text(Util.TAGS[2]),
            onPressed: (){

            },
          ),
        ],
      ),
    );
  }
}
