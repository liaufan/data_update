// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:auto_size_text/auto_size_text.dart';
import 'package:bmsm/controllers/update.controller.dart';
import 'package:bmsm/helpers/cloud_function.helper.dart';
import 'package:bmsm/ui/update.page.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SearchController extends GetxController {
  RxList masters = [].obs;
  RxList members = [].obs;
  String searchTerm = "";
  FirebaseFirestore firestore = FirebaseFirestore.instance;
  RxBool isSearching = false.obs;
  RxList<Widget> results = <Widget>[].obs;
  UpdateController udpateController = Get.find();

  @override
  void onInit() {
    super.onInit();
    masters.clear();
    firestore.collection("members").get().then((documents) {
      for (var doc in documents.docs) {
        masters.add(doc.data());
      }
    });
  }

  searchMembers(String searchTerm) async {
    var result = await CloudFunctionHelper().queryMembers(searchTerm);
    print(result);
  }

  manuallySearchMembers(String searchTerm) async {
    if (searchTerm.isEmpty) {
      return;
    }
    isSearching.value = true;
    members.clear();
    results.clear();

    for (var master in masters) {
      if ((master["name"] as String)
          .toLowerCase()
          .contains(searchTerm.toLowerCase())) {
        members.add(master);
      }
    }

    for (var member in members) {
      results.add(Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          AutoSizeText(
            member["name"],
            minFontSize: 24,
          ),
          SizedBox(
            height: 10,
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                width: 300,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(width: 75, child: AutoSizeText("Member ID:")),
                    Spacer(),
                    SizedBox(
                      width: 200,
                      child: AutoSizeText(member["memberNumber"] == ""
                          ? "Please Provide"
                          : member["memberNumber"]),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 5,
              ),
              SizedBox(
                width: 300,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(width: 75, child: AutoSizeText("IC Number:")),
                    Spacer(),
                    SizedBox(
                      width: 200,
                      child: AutoSizeText(
                          member["ic"] == "" ? "Please Provide" : member["ic"]),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 5,
              ),
              SizedBox(
                width: 300,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(width: 75, child: AutoSizeText("Phone:")),
                    Spacer(),
                    SizedBox(
                      width: 200,
                      child: AutoSizeText(member["phone"] == ""
                          ? "Please Provide"
                          : member["phone"]),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 5,
              ),
              SizedBox(
                width: 300,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(width: 75, child: AutoSizeText("Email:")),
                    Spacer(),
                    SizedBox(
                      width: 200,
                      child: AutoSizeText(member["email"] == ""
                          ? "Please Provide"
                          : member["email"]),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 5,
              ),
              SizedBox(
                width: 300,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(width: 75, child: AutoSizeText("Address:")),
                    Spacer(),
                    SizedBox(
                      width: 200,
                      child: AutoSizeText(member["address"] == ""
                          ? "Please Provide"
                          : member["address"]),
                    ),
                  ],
                ),
              ),
            ],
          ),
          SizedBox(
            height: 15,
          ),
          ElevatedButton(
              onPressed: () {
                udpateController.memberId = member["memberNumber"] as String;
                udpateController.name = member["name"] as String;
                Get.to(UpdatePage());
              },
              child: Text("Update")),
          SizedBox(
            height: 25,
          ),
        ],
      ));
    }
    isSearching.value = false;
  }
}
