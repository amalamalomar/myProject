import 'package:get/get.dart';
import '../screens/Activity_Screen/update_activites/update_controller.dart';
class UpdateBending implements Bindings{
    UpdateController controller=Get.find();
void dependencies()
{
    Get.lazyPut(()=>UpdateController());
}
}