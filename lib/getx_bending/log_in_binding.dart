import 'package:get/get.dart';
import '../screens/log_in/log_in_controller.dart';
class LogInBending implements Bindings{
    LogInController controller=Get.find();
void dependencies()
{
    Get.lazyPut(()=>LogInController());
}
}