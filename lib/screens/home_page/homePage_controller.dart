import 'package:charityapp/controller/modelwaguser1.dart';
import 'package:charityapp/screens/home_page/homePage_services.dart';
import 'package:get/get.dart';

class HomePageController extends GetxController {
  List<Datum> dataList = [];
  String message = 'cc';
  int status = 0;

  HomePageServices homepageServices = HomePageServices();
  var isLoding = true.obs;

  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() async {
    dataList = await homepageServices.getdatacharity();
    isLoding(false);
    super.onReady();
  }
}
