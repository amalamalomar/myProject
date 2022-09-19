// To parse this JSON data, do
//
//     final loginModel = loginModelFromJson(jsonString);

import 'dart:convert';

LoginModel loginModelFromJson(String str) => LoginModel.fromJson(json.decode(str));

String loginModelToJson(LoginModel data) => json.encode(data.toJson());

class LoginModel {
    LoginModel({
        required this.user,
        required this.tokenType,
        required this.accessToken,
    });

    User user;
    String tokenType;
    String accessToken;

    factory LoginModel.fromJson(Map<String, dynamic> json) => LoginModel(
        user: User.fromJson(json["user"]),
        tokenType: json["token_type"],
        accessToken: json["access_token"],
    );

    Map<String, dynamic> toJson() => {
        "user": user.toJson(),
        "token_type": tokenType,
        "access_token": accessToken,
    };
    
}

class User {
    User({
        required this.id,
        required this.fName,
        required this.lName,
        required this.email,
        this.emailVerifiedAt,
        required this.charityId,
        required this.createdAt,
        required this.updatedAt,
    }) {
      // TODO: implement 
      throw UnimplementedError();
    }

    int id;
    String fName;
    String lName;
    String email;
    dynamic emailVerifiedAt;
    int charityId;
    DateTime createdAt;
    DateTime updatedAt;

    factory User.fromJson(Map<String, dynamic> json) => User(
        id: json["id"],
        fName: json["f_name"],
        lName: json["l_name"],
        email: json["email"],
        emailVerifiedAt: json["email_verified_at"],
        charityId: json["charity_id"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "f_name": fName,
        "l_name": lName,
        "email": email,
        "email_verified_at": emailVerifiedAt,
        "charity_id": charityId,
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
    };





    
}
