import 'package:charityapp/screens/Activity_Screen/add_activity/add_activity_services.dart';
import 'package:get/get.dart';

class AddActivityController extends GetxController{
String title=" ";
String cost=" ";
String description=" ";
var addActivityStatus=false;
AddActivityServices addActivityServices=AddActivityServices();
Future<void> addActivity(String title,String cost,String description) async
{
    addActivityStatus=await addActivityServices.addActivity(title,cost,description);
}
}