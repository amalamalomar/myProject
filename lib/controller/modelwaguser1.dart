import 'dart:convert';
///////////////////////////////////////////////////////

/////////////
// To parse this JSON data, do
//
//     final modelcharities = modelcharitiesFromJson(jsonString);



Modelcharities modelcharitiesFromJson(String str) => Modelcharities.fromJson(json.decode(str));

String modelcharitiesToJson(Modelcharities data) => json.encode(data.toJson());

class Modelcharities {
    Modelcharities({
        required this.data,
      required  this.message,
       required this.status,
    });

    List<Datum> data;
    String message;
    int status;

    factory Modelcharities.fromJson(Map<String, dynamic> json) => Modelcharities(
        data: List<Datum>.from(json["data"].map((x) => Datum.fromJson(x))),
        message: json["message"],
        status: json["status"],
    );

    Map<String, dynamic> toJson() => {
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
        "message": message,
        "status": status,
    };
}

class Datum {
    Datum({
        required this.imgUrl,
       required this.telephone,
      required  this.workingHours,
      required  this.description,
    });

    String imgUrl;
    int telephone;
    int workingHours;
    String description;

    factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        imgUrl: json["img_url"],
        telephone: json["telephone"],
        workingHours: json["working_hours"],
        description: json["description"],
    );

    Map<String, dynamic> toJson() => {
        "img_url": imgUrl,
        "telephone": telephone,
        "working_hours": workingHours,
        "description": description,
    };
}





/////////////////////////

/*


// To parse this JSON data, do
//
//     final modelloginregester = modelloginregesterFromJson(jsonString);



Modelloginregester modelloginregesterFromJson(String str) => Modelloginregester.fromJson(json.decode(str));

String modelloginregesterToJson(Modelloginregester data) => json.encode(data.toJson());

class Modelloginregester {
    Modelloginregester({
        required this.users,
        required this.message,
        required this.status,
    });

    final List<User> users;
   final String message;
    final int status;

    factory Modelloginregester.fromJson(Map<String, dynamic> json) => Modelloginregester(
        users: List<User>.from(json["users"].map((x) => User.fromJson(x))),
        message: json["message"],
        status: json["status"],
    );

    Map<String, dynamic> toJson() => {
        "users": List<dynamic>.from(users.map((x) => x.toJson())),
        "message": message,
        "status": status,
    };
}

class User {
    User({
        required this.email,
        required this.password,
    });

    final String email;
    final int password;

    factory User.fromJson(Map<String, dynamic> json) => User(
        email: json["email"],
        password: json["password"],
    );

    Map<String, dynamic> toJson() => {
        "email": email,
        "password": password,
    };
}


*/











/*
// To parse this JSON data, do
//
//     final modelwaguser = modelwaguserFromJson(jsonString);

import 'dart:convert';

Modelwaguser modelwaguserFromJson(String str) => Modelwaguser.fromJson(json.decode(str));

//String modelwaguserToJson(Modelwaguser data) => json.encode(data.toJson());

class Modelwaguser {
    Modelwaguser({
        required this.title,
        required this.description,
        required this.category,
        required this.image,
    });

    String title;
    String description;
    String category;
    String image;

    factory Modelwaguser.fromJson(Map<String, dynamic> json) => Modelwaguser(
        title: json["title"],
        description: json["description"],
        category: json["category"],
        image: json["image"],
    );

    /*Map<String, dynamic> toJson() => {
        "title": title,
        "description": description,
        "category": category,
        "image": image,
    };*/
}

*/
