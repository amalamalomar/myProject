import 'package:http/http.dart' as http;
import '../../../configuration/api.dart';
import'dart:convert';
import'../../../configuration/secure_storage.dart';
class UpdateServices{
    var token;
    late SecureStorage  secureStorage=SecureStorage();
    Future<bool>update(String title,String cost,String description,int idActivity)async
    {

    var url=Uri.parse(baseUrl + updateRoute +"$idActivity");
token=await secureStorage.readToken('token');
    var response=await http.put(
        url,
   headers:{'Authorization': 'Bearer $token'
},
        body:{
            'title':title,
            'cost':cost,
            'description':description,
            'completed':'1',
          
        }
    );
    if(response.statusCode==200)
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