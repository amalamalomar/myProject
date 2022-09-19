// To parse this JSON data, do
//
//     final addActivityModel = addActivityModelFromJson(jsonString);

import 'dart:convert';

AddOrderModel addActivityModelFromJson(String str) => AddOrderModel.fromJson(json.decode(str));

String addActivityModelToJson(AddOrderModel data) => json.encode(data.toJson());

class AddOrderModel {
    AddOrderModel({
        required this.data,
        required this.message,
        required this.status,
    });

    DataOrder data;
    String message;
    int status;

    factory AddOrderModel.fromJson(Map<String, dynamic> json) => AddOrderModel(
        data: DataOrder.fromJson(json["data"]),
        message: json["message"],
        status: json["status"],
    );

    Map<String, dynamic> toJson() => {
        "data": data.toJson(),
        "message": message,
        "status": status,
    };
}

class DataOrder {
    DataOrder({
        required this.userName,
        required this.dateType,
        required this.typeOrder,
      
    });

    String userName;
    String dateType;
    String typeOrder;
   

    factory DataOrder.fromJson(Map<String, dynamic> json) => DataOrder(
        userName: json["userName"],
        dateType: json["dateType"],
        typeOrder: json["typeOrder"],
     
    );

    Map<String, dynamic> toJson() => {
        "userName": userName,
        "dateType": dateType,
        "typeOrder": typeOrder,
      
    };
}
