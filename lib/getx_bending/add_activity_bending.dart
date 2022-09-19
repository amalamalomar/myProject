import 'package:charityapp/screens/Activity_Screen/add_activity/add_activity_controller.dart';
import 'package:get/get.dart';
class AddActivityBending implements Bindings{
    AddActivityController controller=Get.find();
@override
  void dependencies()
{
    Get.lazyPut(()=>AddActivityController());
}
}