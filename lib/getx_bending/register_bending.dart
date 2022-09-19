import 'package:get/get.dart';
import '../screens/register/register_controller.dart';
class LogInBending implements Bindings{
    RegisterController controller=Get.find();
void dependencies()
{
    Get.lazyPut(()=>RegisterController());
}
}