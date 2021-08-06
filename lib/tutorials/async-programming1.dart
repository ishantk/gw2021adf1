// @dart=2.9
fetchDataFromServer(){
  print("Fetching Some Data...");
  // Logic
  print("News Fetched from Server...");
}

var apiKeys = <String>[
  "key1",
  "key2",
  "key3",
  "key4",
  "key5",
];

validateAPIKey(String key){
  if(apiKeys.contains(key)){
    Future.delayed(
        Duration(seconds: 2), fetchDataFromServer
    );
  }else{
    print("Sorry. Auth Failed");
  }
}

/*void main() {
  print("App Started");
  validateAPIKey("key3");
  print("App Finished");
}*/

Future<String> getUserData(String uid){
  print("Getting Data..");
  // logic
  return Future.delayed(Duration(seconds: 5),
          ()=>"${uid} | John Watson | john@example.com"
  );
}

void fetchDetails() async{
  print("Fetching Details..");
  String response = await getUserData("john.watson");
  print("Got the Data");
  print("Response: ${response}");
}

// void main() {
//   print("App Started");
//   fetchDetails();
//   print("App Finished");
// }

/*
// The function returing Future of some datatype
// will be executed automatically in background i.e. as child thread
Future<String> getUserData(String uid){
  print("Getting Data..");
  // logic
  return Future.delayed(Duration(seconds: 5),
          ()=>"${uid} | John Watson | john@example.com"
  );
}

Future<String> fetchDetails() async{
  print("Fetching Details..");
  String response = await getUserData("john.watson");
  print("Got the Data");
  print("Response: ${response}");

  return Future.delayed(Duration(seconds: 10),
          () => "${response} Thank You"
  );

}

void main() async{
  print("App Started");
  String finalResponse = await fetchDetails();
  print("Final Response: ${finalResponse}");
  print("App Finished");
}
 */