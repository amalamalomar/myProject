
import 'package:charityapp/controller/modelCurrentActivities.dart';
import 'package:http/http.dart' as http;
import '../../../configuration/api.dart';
//import'dart:convert';
import'../../../configuration/secure_storage.dart';


class CurrentActivitiesServices{
var message;

    Future<List<dynamic>>getCurrentActivities()async
    {

    var url=Uri.parse(baseUrl + getCurrentActivityRoute);

    var response=await http.get(url);
   
print(response.statusCode);
print(response.body);

    if(response.statusCode==200)
    {

   var resl = currentActivCardModelFromJson(response.body);
   return resl.data;
   
    }
     
      else
      {
        // print(response.body);
          return [];
      }
     
    }
}