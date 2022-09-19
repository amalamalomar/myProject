import 'package:get/get.dart';
import '../register/register_services.dart';
class RegisterController extends GetxController{
String firstName=" ";
String lastName=" ";
String email=" ";
String password=" ";
String confirmPassword=" ";
int id=0;
var registerStatus=false;
RegisterServices registerServices=RegisterServices();
Future<void> register(String firstName,String lastName,String email,
String password,String confirmPassword,int id) async//int id
{
    registerStatus=await registerServices.register(firstName,lastName,email,password,confirmPassword,id);//id);
}
}