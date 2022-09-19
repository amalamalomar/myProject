import 'package:charityapp/screens/Order_Screen/order_menu/order_menu_controller.dart';
import 'package:get/get.dart';
class OrderMenuBending implements Bindings{

   // HomePageController controller=Get.find();
@override
  void dependencies()
{
Get.put<OrderMenuController>(OrderMenuController());
  //  Get.lazyPut(()=>HomePageController());
}
}