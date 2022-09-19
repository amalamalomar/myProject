
import 'package:charityapp/screens/Order_Screen/order_menu/order_menu_services.dart';
import 'package:get/get.dart';

class OrderMenuController extends GetxController{
  List<dynamic> dataOrderMenuList=[];
 String message='';
    int status=0;
OrderMenuServices orderMenuServices=   OrderMenuServices();
var isLoding=true.obs;

@override
void onInit(){
  super.onInit();
}

@override
void onReady() async{
dataOrderMenuList=await orderMenuServices.getOrderMenu();
isLoding(false);
  super.onReady();
}

}



