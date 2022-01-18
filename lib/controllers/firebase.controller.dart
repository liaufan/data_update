import 'package:get/get.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:jiffy/jiffy.dart';

class FirebaseController extends GetxController {
  final bool isPanDown = false;
  final List<String> types = [];
  RxString selectedType = "".obs;
  RxList members = [].obs;

  bool isAscending = true;
  RxList<String> dates = <String>[].obs;

  final eventsRef = FirebaseFirestore.instance.collection("events");
  final membersRef = FirebaseFirestore.instance.collection("members");
  final typesRef = FirebaseFirestore.instance.collection("types");

  @override
  void onInit() {
    super.onInit();
    types.clear();
    dates.clear();
    members.clear();

    typesRef.get().then((value) {
      value.docs.forEach((doc) {
        types.add(doc.data()["name"]);
      });

      selectedType.value = types[0];
    });

    eventsRef.get().then((value) {
      List<DateTime> temp = [];
      value.docs.forEach((doc) {
        if (doc.data()["type"] ==
            selectedType.toLowerCase().replaceAll(" ", "_")) {
          temp.add(doc.data()["date"].toDate());
        }
      });

      temp.sort((a, b) => a.compareTo(b));
      temp.forEach((element) {
        dates.add(Jiffy(element).yMMMd);
      });
    });

    membersRef.get().then((value) {
      value.docs.forEach((doc) {
        if (doc.data()["type"] ==
            selectedType.toLowerCase().replaceAll(" ", "_")) {
          List<String> attendance_date = [];
          doc.data()["attendance"].forEach((a) {
            attendance_date.add(Jiffy(a.toDate()).yMMMd);
          });

          List<String> attendance = [];

          dates.forEach((date) {
            if (attendance_date.contains(date)) {
              attendance.add("Present");
            } else {
              attendance.add("Absent");
            }
          });

          members.add(UserInfo(
              doc.data()["name_chi"],
              ((attendance_date.length / dates.length) * 100)
                      .round()
                      .toString() +
                  "%",
              attendance));
        }
      });
    });
  }

  reloadMembers() {
    members.clear();
    dates.clear();

    eventsRef.get().then((value) {
      List<DateTime> temp = [];
      value.docs.forEach((doc) {
        if (doc.data()["type"] ==
            selectedType.toLowerCase().replaceAll(" ", "_")) {
          temp.add(doc.data()["date"].toDate());
        }
      });

      temp.sort((a, b) => a.compareTo(b));
      temp.forEach((element) {
        dates.add(Jiffy(element).yMMMd);
      });
    });
    membersRef.get().then((value) {
      value.docs.forEach((doc) {
        if (doc.data()["type"] ==
            selectedType.toLowerCase().replaceAll(" ", "_")) {
          List<String> attendance_date = [];
          doc.data()["attendance"].forEach((a) {
            attendance_date.add(Jiffy(a.toDate()).yMMMd);
          });

          List<String> attendance = [];

          dates.forEach((date) {
            if (attendance_date.contains(date)) {
              attendance.add("Present");
            } else {
              attendance.add("Absent");
            }
          });

          members.add(UserInfo(
              doc.data()["name_chi"],
              ((attendance_date.length / dates.length) * 100)
                      .round()
                      .toString() +
                  "%",
              attendance));
        }
      });
    });
  }
}

class UserInfo {
  String name;
  String percentage;
  List<String> attendances;

  UserInfo(this.name, this.percentage, this.attendances);
}
