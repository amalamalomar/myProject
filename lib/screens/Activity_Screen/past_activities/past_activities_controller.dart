
import 'package:charityapp/screens/Activity_Screen/past_activities/past_activities_services.dart';
import 'package:get/get.dart';
class PastActivitiesController extends GetxController{
  List<dynamic> dataPastAct=[];
 String message='';
    int status=0;
PastActivitiesServices pastActivitiesServices=   PastActivitiesServices();
var isLoding=true.obs;

@override
void onInit(){
  super.onInit();
}

@override
void onReady() async{
dataPastAct=await pastActivitiesServices.getPastActivities();
isLoding(false);
  super.onReady();
}

}



