import 'package:charityapp/screens/Activity_Screen/current_activity/current_activity_controller.dart';
import 'package:get/get.dart';
class CurrentActivitiesBending implements Bindings{

   // HomePageController controller=Get.find();
@override
  void dependencies()
{
Get.put<CurrentActivitiesController>(CurrentActivitiesController());
  //  Get.lazyPut(()=>HomePageController());
}
}