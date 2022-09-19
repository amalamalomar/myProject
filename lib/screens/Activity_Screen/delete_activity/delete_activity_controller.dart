import 'package:charityapp/screens/Activity_Screen/add_activity/add_activity_services.dart';
import 'package:get/get.dart';

import 'delete_activity_services.dart';

class DeleteActivityController extends GetxController {
  var idActivity = 0;
  var deleteActivityStatus = false;
  DeleteActivityServices deletectivityServices = DeleteActivityServices();
  Future<void> delete(int idActivity) async {
    deleteActivityStatus =
        await deletectivityServices.deleteActivity(idActivity);
  }
}
