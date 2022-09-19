import 'package:http/http.dart' as http;
import '../../../configuration/api.dart';
import'dart:convert';
import'../../../configuration/secure_storage.dart';
class AddOrderServices{
    var token;
    late SecureStorage  secureStorage=SecureStorage();

    Future<bool>addOrderes(String userName,String dateType,String typeOrder,int iduser)async
    {

    var url=Uri.parse(baseUrl + addOrderRoute);
  token=await secureStorage.readToken('token');
    var response=await http.post(
        url,
       headers:{'Authorization': 'Bearer $token'
},
        body:{
            'userName': userName,
            'dateType': dateType,
            'typeOrder': typeOrder,
            'completed':'1',
            'role_id':iduser
        }
    );
    if(response.statusCode==201)
    {
        print(response.body);
     return true;
    }
     
      else
      {
         print(response.body);
          return false;
      }
     
    }
}