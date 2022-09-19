import 'package:get/get.dart';
import '../log_in/log_in_services.dart';
class LogInController extends GetxController{
String email=" ";
String password=" ";
var logInStatus=false;
int iduser=0;
LogInServices logInServices=LogInServices();
Future<void> logIn(email,password, ) async
{
    logInStatus=await logInServices.logIn(email,password);
}
}