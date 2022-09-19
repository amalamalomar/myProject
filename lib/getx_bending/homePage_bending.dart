import 'package:charityapp/screens/home_page/homePage_controller.dart';
import 'package:get/get.dart';
class HomePageBending implements Bindings{

   // HomePageController controller=Get.find();
@override
  void dependencies()
{
Get.put<HomePageController>(HomePageController());
  //  Get.lazyPut(()=>HomePageController());
}
}