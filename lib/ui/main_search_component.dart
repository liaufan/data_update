import 'package:bmsm/controllers/search.controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MainSearchComponent extends StatelessWidget {
  MainSearchComponent({
    Key? key,
  }) : super(key: key);

  final TextEditingController textEditingController = TextEditingController();
  final SearchController searchController = Get.find();

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          TextFormField(
              controller: textEditingController,
              onChanged: (value) {
                searchController.searchTerm = value;
              }),
          ElevatedButton(
              onPressed: () {
                searchController.searchMembers(searchController.searchTerm);
              },
              child: const Text("Submit"))
        ],
      ),
    );
  }
}
