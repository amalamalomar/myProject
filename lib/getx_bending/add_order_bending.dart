import 'package:charityapp/screens/Order_Screen/add_order/add_order_controller.dart';
import 'package:get/get.dart';
class AddOrderBending implements Bindings{
    AddOrderController controller=Get.find();
@override
  void dependencies()
{
    Get.lazyPut(()=>AddOrderController());
}
}