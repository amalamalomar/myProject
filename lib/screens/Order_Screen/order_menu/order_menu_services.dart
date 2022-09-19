import 'dart:convert';

import 'package:charityapp/controller/modelPastActivities.dart';
import 'package:charityapp/controller/model_order_menu.dart';
import 'package:http/http.dart' as http;
import '../../../configuration/api.dart';
//import'dart:convert';
import'../../../configuration/secure_storage.dart';


class OrderMenuServices{
var message;

    Future<List<dynamic>>getOrderMenu()async
    {

    var url=Uri.parse(baseUrl + getOrderMenuRoute);

    var response=await http.get(url);
   
print(response.statusCode);
print(response.body);

    if(response.statusCode==200)
    {

   var resl = OrderMenuCardModelFromJson(response.body);
   return resl.data;
   
    }
     
      else
      {
        // print(response.body);
          return [];
      }
     
    }
}