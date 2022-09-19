import 'package:charityapp/controller/modelwaguser1.dart';
import 'package:charityapp/screens/Activity_Screen/current_activity/current_activity_services.dart';
import 'package:get/get.dart';
class CurrentActivitiesController extends GetxController{
  List<dynamic> dataCurrentAct=[];
 String message='';
    int status=0;
CurrentActivitiesServices  currentActivitiesServices=   CurrentActivitiesServices();
var isLoding=true.obs;

@override
void onInit(){
  super.onInit();
}

@override
void onReady() async{
dataCurrentAct=await currentActivitiesServices.getCurrentActivities();
isLoding(false);
  super.onReady();
}

}



