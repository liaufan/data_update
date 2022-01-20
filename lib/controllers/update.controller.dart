// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';

class UpdateController extends GetxController {
  String name = "";
  String memberId = "";
  String identification = "";
  String phone = "";
  String email = "";
  String address = "";
  FirebaseFirestore firestore = FirebaseFirestore.instance;

  @override
  void onInit() {
    super.onInit();
  }

  uploadNewInformation() {
    if (name == "" ||
        memberId == "" ||
        identification == "" ||
        phone == "" ||
        email == "" ||
        address == "") {
      return;
    }
    firestore.collection("new_members").doc(memberId).set({
      "name": name,
      "memberId": memberId,
      "NRIC": identification,
      "phone": phone,
      "email": email,
      "address": address
    }).then((value) {
      clear();
    });
  }

  clear() {
    name = "";
    memberId = "";
    identification = "";
    phone = "";
    email = "";
    address = "";
  }
}
