import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:bmsm/controllers/attendance.controller.dart';
import 'package:bmsm/controllers/events_list.controller.dart';
import 'package:bmsm/controllers/update.controller.dart';
import 'package:bmsm/helpers/dropdown.helper.dart';
import 'package:horizontal_data_table/horizontal_data_table.dart';

class EventsListComponent extends StatefulWidget {
  EventsListComponent({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  _EventsListComponentState createState() => _EventsListComponentState();
}

class _EventsListComponentState extends State<EventsListComponent> {
  final AttendanceController attendanceController = Get.find();
  final UpdateController updateController = Get.find();
  final EventsListController eventsListController = Get.find();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Column(mainAxisSize: MainAxisSize.min, children: [
      Row(children: [
        SizedBox(
          width: 150,
          child: Obx(() => AwesomeDropDown(
                elevation: 3,
                isPanDown: attendanceController.isPanDown,
                dropDownList: attendanceController.types,
                dropDownIcon: const Icon(
                  Icons.arrow_drop_down,
                  color: Colors.grey,
                  size: 23,
                ),
                selectedItem: attendanceController.selectedType.value,
                onDropDownItemClick: (selectedType) {
                  attendanceController.selectedType.value = selectedType;
                  attendanceController.reloadMembers();
                },
                dropStateChanged: (isOpened) {
                  // _isDropDownOpened = isOpened;
                  // if (!isOpened) {
                  //   _isBackPressedOrTouchedOutSide = false;
                  // }
                },
              )),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 10, top: 10),
          child: SizedBox(
            width: 180,
            height: 50,
            child: ElevatedButton(
                onPressed: () {
                  updateController.onInit();
                  Get.toNamed('/update')!.then((value) {
                    attendanceController.onInit();
                  });
                },
                child: Text("Update My Attendance"),
                style: ButtonStyle(
                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                        RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(36.0),
                )))),
          ),
        )
      ]),
      Spacer(),
      Padding(padding: const EdgeInsets.all(8.0), child: buildEventsGrid()),
    ]);
  }

  Widget buildEventsGrid() {
    List<Widget> eventItems = [];
    eventsListController.eventsRef;

    return Column(children: eventItems);
  }
}
