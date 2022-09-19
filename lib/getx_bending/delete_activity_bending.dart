import 'package:charityapp/screens/Activity_Screen/delete_activity/delete_activity_controller.dart';
import 'package:get/get.dart';
import '../screens/Activity_Screen/update_activites/update_controller.dart';
class DeleteBending implements Bindings{
    DeleteActivityController controller=Get.find();
void dependencies()
{
    Get.lazyPut(()=>DeleteActivityController());
}
}