// To parse this JSON data, do
//
//     final registerModel = registerModelFromJson(jsonString);

import 'dart:convert';

RegisterModel registerModelFromJson(String str) => RegisterModel.fromJson(json.decode(str));

String registerModelToJson(RegisterModel data) => json.encode(data.toJson());

class RegisterModel {
    RegisterModel({
        required this.message,
        required this.user,
        required this.tokenType,
        required this.accessToken,
    });

    String message;
    User user;
    String tokenType;
    String accessToken;

    factory RegisterModel.fromJson(Map<String, dynamic> json) => RegisterModel(
        message: json["message"],
        user: User.fromJson(json["user"]),
        tokenType: json["token_type"],
        accessToken: json["access_token"],
    );

    Map<String, dynamic> toJson() => {
        "message": message,
        "user": user.toJson(),
        "token_type": tokenType,
        "access_token": accessToken,
    };
}

class User {
    User({
        required this.fName,
        required this.lName,
        required this.email,
     //   required this.charityId,
        required this.updatedAt,
        required this.createdAt,
        required this.id,
    });

    String fName;
    String lName;
    String email;
   // int charityId;
    DateTime updatedAt;
    DateTime createdAt;
    int id;

    factory User.fromJson(Map<String, dynamic> json) => User(
        fName: json["f_name"],
        lName: json["l_name"],
        email: json["email"],
     //   charityId: json["charity_id"],
        updatedAt: DateTime.parse(json["updated_at"]),
        createdAt: DateTime.parse(json["created_at"]),
        id: json["id"],
    );

    Map<String, dynamic> toJson() => {
        "f_name": fName,
        "l_name": lName,
        "email": email,
      //  "charity_id": charityId,
        "updated_at": updatedAt.toIso8601String(),
        "created_at": createdAt.toIso8601String(),
        "id": id,
    };
}
