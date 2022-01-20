import 'package:bmsm/controllers/search.controller.dart';
import 'package:bmsm/controllers/update.controller.dart';
import 'package:get/get.dart';

class GetInitializer extends Bindings {
  @override
  void dependencies() {
    // these controllers are yet to be initiallized
    // they will be initialized when they are referenced
    // Get.put<AttendanceController>(AttendanceController());
    // Get.put<UpdateController>(UpdateController());
    // Get.put<EventsListController>(EventsListController());
    Get.put<UpdateController>(UpdateController());
    Get.put<SearchController>(SearchController());
  }
}
