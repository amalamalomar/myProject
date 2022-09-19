import 'package:charityapp/screens/Order_Screen/add_order/add_order_servives.dart';
import 'package:get/get.dart';

class AddOrderController extends GetxController{
   String userName="";
    String dateType="";
    String typeOrder="";

var addOrderStatus=false;
AddOrderServices addOrderServices=AddOrderServices();
Future<void> addOrder(String userName,String dateType,String typeOrder,int iduser) async
{
    addOrderStatus=await addOrderServices.addOrderes(userName,dateType,typeOrder,iduser);
}
}