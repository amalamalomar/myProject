import 'dart:convert';

import 'package:charityapp/configuration/secure_storage.dart';
import 'package:http/http.dart' as http;
import '../../configuration/api.dart';
class LogInServices{
    var token;
  
    SecureStorage secureStorage=SecureStorage();
    Future<bool>logIn(String email,String password) async
    {

    var url=Uri.parse(baseUrl + logInRoute);
    print(url);
    print(email);
    print(password);
    token=await secureStorage.readToken('token');
    var response=await http.post(
        url,headers:{'Authorization': 'Bearer $token'
},body:{
            'email':email,
            'password':password,
           // 'role_id':'$iduser'
        }
    );
    if(response.statusCode==200)
    {
        print("sucsess");
        print(response.body);
        print("---------------->");

  Map<String, dynamic> map = jsonDecode(response.body);
      print(map['user']);
      var data=map['access_token'];
      print("tokn is :");
    //  print(data);
      //print(map['access_token']);
 // await secureStorage.deleteToken('token');
     await secureStorage.saveToken('token',map['access_token'] as String);

     print(await secureStorage.readToken('token'));

        //  print("idrol is --------->$iduser");
 return true;
    }
     
      else
      {
         print("error");
          return false;
      }
     
    }
}