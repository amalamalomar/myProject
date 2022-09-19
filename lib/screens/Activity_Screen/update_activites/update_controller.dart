import 'package:get/get.dart';
import 'update_services.dart';
class UpdateController extends GetxController{
String title=" ";
String cost=" ";
String description=" ";
int idActivity=0;
var updateStatus=false;
UpdateServices updateServices=UpdateServices();
Future<void> updateActivity(String title,String cost,String description,int idActivity) async
{
    updateStatus=await updateServices.update(title,cost,description,idActivity);
}
}