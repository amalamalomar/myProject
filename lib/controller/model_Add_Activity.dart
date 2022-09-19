// To parse this JSON data, do
//
//     final addActivityModel = addActivityModelFromJson(jsonString);

import 'dart:convert';

AddActivityModel addActivityModelFromJson(String str) => AddActivityModel.fromJson(json.decode(str));

//String addActivityModelToJson(AddActivityModel data) => json.encode(data);
String addActivityModelToJson(AddActivityModel data) => json.encode(data.toJson());


class AddActivityModel {
    AddActivityModel({
        required this.data,
        
        required this.message,
        required this.status,
    });
 //List<Data> data;
    Data data;
    String message;
    int status;

    factory AddActivityModel.fromJson(Map<String, dynamic> json) => AddActivityModel(
      //  data: (json['data'] as List<Data>)
      //   .map(
      //   (e) =>  Data.fromJson(e as Map<String, dynamic>))
      //  .toList(),
        data: Data.fromJson(json["data"]),
        message: json["message"],
        status: json["status"],
    );
    //   Map<String, dynamic> toJson(AddActivityModel instance) =>{

    //    "data":instance.data,
    //     "message": message,
    //     "status": status,
    // };

    Map<String, dynamic> toJson() =>{

       "data": data.toJson(),
        "message": message,
        "status": status,
    };
    
}

class Data {
    Data({
        required this.title,
        required this.cost,
        required this.description,
    //    this.charityId,
        this.completed,
    });

    String title;
    String cost;
    String description;
   // String charityId;
    dynamic completed;

    factory Data.fromJson(Map<String, dynamic> json) => Data(
        title: json["title"],
        cost: json["cost"],
        description: json["description"],
      //  charityId: json["charity_id"],
        completed: json["completed"],
    );

    Map<String, dynamic> toJson() => {
        "title": title,
        "cost": cost,
        "description": description,
      //  "charity_id": charityId,
        "completed": completed,
    };
}
