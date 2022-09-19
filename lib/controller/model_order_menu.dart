


// To parse this JSON data, do
//
//     final currentActivCardModel = currentActivCardModelFromJson(jsonString);

import 'dart:convert';

OrderMenuCardModel OrderMenuCardModelFromJson(String str) => OrderMenuCardModel.fromJson(json.decode(str));

String OrderMenuCardModelToJson(OrderMenuCardModel data) => json.encode(data.toJson());

class OrderMenuCardModel {
    OrderMenuCardModel({
        required this.data,
        required this.message,
        required this.status,
    });

    List<dynamic> data;
    String message;
    int status;

    factory OrderMenuCardModel.fromJson(Map<String, dynamic> json) => OrderMenuCardModel(
        data: List<dynamic>.from(json["data"].map((x) => x)),
        message: json["message"],
        status: json["status"],
    );

    Map<String, dynamic> toJson() => {
        "data": List<dynamic>.from(data.map((x) => x)),
        "message": message,
        "status": status,
    };
}
