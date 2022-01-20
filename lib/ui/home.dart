import 'package:bmsm/ui/main_search_component.dart';
import 'package:flutter/material.dart';
import 'package:awesome_dropdown/awesome_dropdown.dart';
import 'package:bmsm/ui/attendance.component.dart';

class Home extends StatelessWidget {
  Home({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 100,
        backgroundColor: Colors.white,
        centerTitle: false,
        title: Text("Buddhist Missionary Society Malaysia"),

        // actions: <Widget>[
        //   TextButton(
        //       onPressed: () {},
        //       child: const Text(
        //         "Eng",
        //         style: TextStyle(color: Colors.blue),
        //       )),
        //   Container(
        //     margin: const EdgeInsets.only(top: 30, bottom: 30),
        //     height: 5,
        //     width: 1,
        //     color: Colors.black,
        //   ),
        //   TextButton(
        //       onPressed: () {},
        //       child: const Text(
        //         "中",
        //         style: TextStyle(color: Colors.black),
        //       )),
        // ],
      ),
      body: MainSearchComponent(),
    );
  }
}
