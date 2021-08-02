import 'package:flutter/material.dart';
/*
  1. Demonstration on ListView
  2. Consuming HTTP REST API
  3. JSON Parsing (extracting the meaningful data from Server as response)
 */

// Hard Coded ListView
class ListViewDemoPage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: EdgeInsets.all(8),
      //padding: EdgeInsets.fromLTRB(left, top, right, bottom)
      children: <ListTile>[
        ListTile(
          title: Text("TechCrunch"),
          subtitle: Text("All headlines from techcrunch"),
          //leading: Text("TC"),
          leading: Container(
            width: 48,
            height: 48,
            decoration: BoxDecoration(
              color: Colors.blueGrey,
              shape: BoxShape.circle
            ),
            child: Center(
              child: Text("TC"),
            ),
          ),
          trailing: Icon(Icons.keyboard_arrow_right_sharp),
          onTap: (){

          },
        ),
        ListTile(
          title: Text("Top Business"),
          leading: Container(
            width: 48,
            height: 48,
            decoration: BoxDecoration(
                color: Colors.blueGrey,
                shape: BoxShape.circle
            ),
            child: Center(
              child: Text("TB"),
            ),
          ),
          subtitle: Text("All headlines from USA Business"),
          trailing: Icon(Icons.keyboard_arrow_right_sharp),
          onTap: (){

          },
        ),
        ListTile(
          title: Text("WallStreet Journal"),
          leading: Container(
            width: 48,
            height: 48,
            decoration: BoxDecoration(
                color: Colors.blueGrey,
                shape: BoxShape.circle
            ),
            child: Center(
              child: Text("WJ"),
            ),
          ),
          subtitle: Text("All headlines from Wallstreet"),
          trailing: Icon(Icons.keyboard_arrow_right_sharp),
          onTap: (){

          },
        ),
      ],
    );
  }
}

var newsData = <Map<String, String>>[
  {
    "title": "Tech Crunch",
    "subTitle": "All headlines from techcrunch"
  },
  {
    "title": "Top Business",
    "subTitle": "All headlines from USA Business"
  },
  {
    "title": "WallStreet Journal",
    "subTitle": "All headlines from Wallstreet"
  }
];

/*getListView(){
  ListView.builder(
    padding: EdgeInsets.all(8),
    itemCount: newsData.length,
    itemBuilder: (context, index) {
      return ListTile(
        title: Text(newsData[index]["title"]!),
        leading: Container(
          width: 48,
          height: 48,
          decoration: BoxDecoration(
              color: Colors.blueGrey,
              shape: BoxShape.circle
          ),
          child: Center(
            child: Text(newsData[index]["title"]!.substring(0, 3)),
          ),
        ),
        subtitle: Text(newsData[index]["subTitle"]!),
        trailing: Icon(Icons.keyboard_arrow_right_sharp),
        onTap: (){

        },
      );
    },
  );
}*/

getListViewChildren(){

  var tiles = <Widget>[];

  newsData.forEach((element) {
    tiles.add(
        ListTile(
          title: Text(element["title"]!),
          leading: Container(
            width: 48,
            height: 48,
            decoration: BoxDecoration(
                color: Colors.blueGrey,
                shape: BoxShape.circle
            ),
            child: Center(
              child: Text(element["title"]!.substring(0, 2).toUpperCase()),
            ),
          ),
          subtitle: Text(element["subTitle"]!),
          trailing: Icon(Icons.keyboard_arrow_right_sharp),
          onTap: (){

          },
        )
    );
    tiles.add(
      Divider()
    );
  });
}



class DynamicListViewDemoPage extends StatelessWidget {
  const DynamicListViewDemoPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // return ListView.builder(
    //   padding: EdgeInsets.all(8),
    //   itemCount: newsData.length,
    //   itemBuilder: (context, index) {
    //
    //     /*var leadingStringList = newsData[index]["title"]!.split(" ");
    //     if(leadingStringList.length >=2){
    //
    //     }else{
    //
    //     }*/
    //
    //     return ListTile(
    //       title: Text(newsData[index]["title"]!),
    //       leading: Container(
    //         width: 48,
    //         height: 48,
    //         decoration: BoxDecoration(
    //             color: Colors.blueGrey,
    //             shape: BoxShape.circle
    //         ),
    //         child: Center(
    //           child: Text(newsData[index]["title"]!.substring(0, 2).toUpperCase()),
    //         ),
    //       ),
    //       subtitle: Text(newsData[index]["subTitle"]!),
    //       trailing: Icon(Icons.keyboard_arrow_right_sharp),
    //       onTap: (){
    //
    //       },
    //     );
    //   },
    // );

    return ListView.separated(
      padding: const EdgeInsets.all(8),
      itemCount: newsData.length,
      itemBuilder: (context, index) {
        return ListTile(
          title: Text(newsData[index]["title"]!),
          leading: Container(
            width: 48,
            height: 48,
            decoration: BoxDecoration(
                color: Colors.blueGrey,
                shape: BoxShape.circle
            ),
            child: Center(
              child: Text(newsData[index]["title"]!.substring(0, 2).toUpperCase()),
            ),
          ),
          subtitle: Text(newsData[index]["subTitle"]!),
          trailing: Icon(Icons.keyboard_arrow_right_sharp),
          onTap: (){

          },
        );
      },
      separatorBuilder: (context, index) {
        return const Divider(color: Colors.white54,height: 2,);
      },
    );
  }
}


class DynamicListViewCustomDemoPage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: EdgeInsets.all(8),
      children: getListViewChildren(),
    );
  }
}



