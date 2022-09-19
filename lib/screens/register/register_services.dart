import 'package:http/http.dart' as http;
import '../../configuration/api.dart';
import'dart:convert';
import'../../configuration/secure_storage.dart';
class RegisterServices{
    var token;
   
    late SecureStorage  secureStorage=SecureStorage();
    Future<bool>register(String firstName,String lastName,
    String email,String password,String confirmPassword,int iduser)async//int iduser
    {

    var url=Uri.parse(baseUrl + registerRoute);
    print(url);
    print(email);
    print(password);
    var response=await http.post(
        url,body:{
            'f_name':firstName,
            'l_name':lastName,
            'email':email,
            'password':password,
            'password_confirmed':confirmPassword,
            'charity_id':'1',
            'role_id':'$iduser'//////////////       <-----string
        }
    );
    if(response.statusCode==200)
    {
    print(response.body);
//       Map<String, dynamic> map = jsonDecode(response.body);
//       print(map['user']);
//       var data=map['access_token'];
//       print("tokn is :");
//     //  print(data);
//       //print(map['access_token']);
//  // await secureStorage.deleteToken('token');
//   await secureStorage.saveToken('token',map['access_token'] as String);
//      print(await secureStorage.readToken('token'));
 return true;
    }
     
      else
      {
         print(response.body);
          return false;
      }
     
    }
}