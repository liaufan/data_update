import 'package:get/get.dart';
import 'package:bmsm/controllers/attendance.controller.dart';
import 'package:bmsm/controllers/events_list.controller.dart';
import 'package:bmsm/controllers/update.controller.dart';

class GetInitializer extends Bindings {
  @override
  void dependencies() {
    // these controllers are yet to be initiallized
    // they will be initialized when they are referenced
    Get.put<AttendanceController>(AttendanceController());
    Get.put<UpdateController>(UpdateController());
    Get.put<EventsListController>(EventsListController());
  }
}
