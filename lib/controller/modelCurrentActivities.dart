
// To parse this JSON data, do
//
//     final currentActivCardModel = currentActivCardModelFromJson(jsonString);

import 'dart:convert';

CurrentActivCardModel currentActivCardModelFromJson(String str) => CurrentActivCardModel.fromJson(json.decode(str));

String currentActivCardModelToJson(CurrentActivCardModel data) => json.encode(data.toJson());

class CurrentActivCardModel {
    CurrentActivCardModel({
        required this.data,
        required this.message,
        required this.status,
    });

    List<dynamic> data;
    String message;
    int status;

    factory CurrentActivCardModel.fromJson(Map<String, dynamic> json) => CurrentActivCardModel(
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
import 'package:flutter/material.dart';

class CurrentActivCardModel {
  String cardHolderName;
  String cardNumber;
  String expDate;
  String cvv;
  Color cardColor;

  CurrentActivCardModel({
    required this.cardHolderName,
    required this.cardNumber,
    required this.cvv,
    required this.expDate,
    required this.cardColor,
  });
}

List<CurrentActivCardModel> myCards = [
  CurrentActivCardModel(
    cardHolderName: "John Doe",
    cardNumber: "****  ****  ****  1234",
    cvv: "**4",
    expDate: "12/21",
    cardColor:Color.fromARGB(255, 176, 162, 209) ,
  ),
  CurrentActivCardModel(
    cardHolderName: "John Doe",
    cardNumber: "****  ****  ****  4321",
    cvv: "**1",
    expDate: "01/22",
    cardColor:Color.fromARGB(255, 176, 162, 209) ,
  ),

  
];


*/