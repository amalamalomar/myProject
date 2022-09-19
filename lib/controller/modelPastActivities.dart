


// To parse this JSON data, do
//
//     final currentActivCardModel = currentActivCardModelFromJson(jsonString);

import 'dart:convert';

PastActivCardModel PastActivCardModelFromJson(String str) => PastActivCardModel.fromJson(json.decode(str));

String PastActivCardModelToJson(PastActivCardModel data) => json.encode(data.toJson());

class PastActivCardModel {
    PastActivCardModel({
        required this.data,
        required this.message,
        required this.status,
    });

    List<dynamic> data;
    String message;
    int status;

    factory PastActivCardModel.fromJson(Map<String, dynamic> json) => PastActivCardModel(
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



/*

/////////////////


import 'package:flutter/material.dart';

class PastActivCardModel {
  String cardHolderName;
  String cardNumber;
  String expDate;
  String cvv;
  Color cardColor;

  PastActivCardModel({
    required this.cardHolderName,
    required this.cardNumber,
    required this.cvv,
    required this.expDate,
    required this.cardColor,
  });
}

List<PastActivCardModel> myCarddd = [
  PastActivCardModel(
    cardHolderName: "John Doe",
    cardNumber: "****  ****  ****  1234",
    cvv: "**4",
    expDate: "12/21",
    cardColor:Color.fromARGB(255, 176, 162, 209) ,
  ),
  PastActivCardModel(
    cardHolderName: "John Doe",
    cardNumber: "****  ****  ****  4321",
    cvv: "**1",
    expDate: "01/22",
    cardColor:Color.fromARGB(255, 176, 162, 209) ,
  ),
 
  
];         

  */