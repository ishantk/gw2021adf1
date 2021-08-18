class AppUser{

  String? uid;
  String? name;
  String? email;
  String? imageUrl;

  AppUser({this.uid, this.name, this.email});

  @override
  String toString() {
    return 'User{uid: $uid, name: $name, email: $email, imageUrl: $imageUrl}';
  }

  Map<String, dynamic> toMap(){
     return {
      "uid": uid,
      "name": name,
      "email": email,
       "imageUrl": "",
    };

  }
}