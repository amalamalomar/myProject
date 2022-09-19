import 'dart:convert';

import 'package:charityapp/controller/modelPastActivities.dart';
import 'package:http/http.dart' as http;
import '../../../configuration/api.dart';
//import'dart:convert';
import'../../../configuration/secure_storage.dart';


class PastActivitiesServices{
var message;

    Future<List<dynamic>>getPastActivities()async
    {

    var url=Uri.parse(baseUrl + getPastActivityRoute);

    var response=await http.get(url);
   
print(response.statusCode);
print(response.body);

    if(response.statusCode==200)
    {

   var resl = PastActivCardModelFromJson(response.body);
   return resl.data;
   
    }
     
      else
      {
        // print(response.body);
          return [];
      }
     
    }
}