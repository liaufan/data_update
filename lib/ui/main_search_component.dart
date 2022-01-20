import 'package:bmsm/controllers/search.controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MainSearchComponent extends StatelessWidget {
  MainSearchComponent({
    Key? key,
  }) : super(key: key);

  final TextEditingController textEditingController = TextEditingController();
  final SearchController searchController = Get.find();

  Widget buildSearchResults(Size size) {
    return Obx(() => Container(
          height: size.height * 0.7 - 150,
          padding: EdgeInsets.all(25),
          child: searchController.results.isEmpty
              ? Container()
              : SingleChildScrollView(
                  child: Column(
                    children: searchController.results,
                  ),
                ),
        ));
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      height: size.height * 100 - 100,
      child: Column(
        children: [
          Image.asset(
            'assets/logos/main.jpg',
            height: size.height * 0.3 - 100,
          ),
          const Text("Member Information Checker"),
          Padding(
            padding: const EdgeInsets.all(25),
            child: TextFormField(
                decoration: InputDecoration(
                  hintText: "Search your name here",
                  focusedBorder: OutlineInputBorder(
                      borderSide: new BorderSide(color: Colors.black)),
                  border: OutlineInputBorder(
                      borderSide: new BorderSide(color: Colors.black)),
                  contentPadding: EdgeInsets.all(8),
                ),
                cursorColor: Colors.black,
                controller: textEditingController,
                onChanged: (value) {
                  searchController.searchTerm = value;
                }),
          ),
          Obx(() => searchController.isSearching.value
              ? const CircularProgressIndicator(
                  color: Colors.amber,
                )
              : ElevatedButton(
                  onPressed: () {
                    searchController
                        .manuallySearchMembers(searchController.searchTerm);
                  },
                  child: const Text("Search"))),
          buildSearchResults(size),
        ],
      ),
    );
  }
}
