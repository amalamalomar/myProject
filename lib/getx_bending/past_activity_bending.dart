import 'package:charityapp/screens/Activity_Screen/past_activities/past_activities_controller.dart';
import 'package:get/get.dart';

class PastActivitiesBending implements Bindings{
   
@override
  void dependencies()
{
Get.put<PastActivitiesController>(PastActivitiesController());

}
}