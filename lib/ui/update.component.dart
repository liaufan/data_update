import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:bmsm/controllers/update.controller.dart';

class UpdateComponent extends StatefulWidget {
  UpdateComponent({Key? key}) : super(key: key);

  @override
  _UpdateComponentState createState() => _UpdateComponentState();
}

class _UpdateComponentState extends State<UpdateComponent> {
  final UpdateController updateController = Get.find();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Container(
      height: size.height * 0.8,
      child: SingleChildScrollView(
        child: Column(children: [
          const Padding(
            padding: EdgeInsets.only(top: 20.0),
            child: Text(
              "Update your information",
              style: TextStyle(
                  fontSize: 20,
                  color: Colors.black,
                  fontWeight: FontWeight.bold),
            ),
          ),
          const Padding(
            padding: EdgeInsets.only(bottom: 20.0),
            child: Text(
              "*All fields are mandatory.",
              style: TextStyle(
                  fontSize: 14, color: Colors.red, fontWeight: FontWeight.bold),
            ),
          ),
          Text(updateController.name),
          Text(updateController.memberId),
          Padding(
            padding: const EdgeInsets.all(25.0),
            child: TextFormField(
                decoration: InputDecoration(
                  hintText: "IC Number",
                  focusedBorder: OutlineInputBorder(
                      borderSide: new BorderSide(color: Colors.black)),
                  border: OutlineInputBorder(
                      borderSide: new BorderSide(color: Colors.black)),
                  contentPadding: EdgeInsets.all(8),
                ),
                cursorColor: Colors.black,
                onChanged: (value) {
                  updateController.identification = value;
                }),
          ),
          Padding(
            padding: const EdgeInsets.all(25.0),
            child: TextFormField(
                decoration: InputDecoration(
                  hintText: "Phone",
                  focusedBorder: OutlineInputBorder(
                      borderSide: new BorderSide(color: Colors.black)),
                  border: OutlineInputBorder(
                      borderSide: new BorderSide(color: Colors.black)),
                  contentPadding: EdgeInsets.all(8),
                ),
                cursorColor: Colors.black,
                onChanged: (value) {
                  updateController.phone = value;
                }),
          ),
          Padding(
            padding: const EdgeInsets.all(25.0),
            child: TextFormField(
                decoration: InputDecoration(
                  hintText: "Email",
                  focusedBorder: OutlineInputBorder(
                      borderSide: new BorderSide(color: Colors.black)),
                  border: OutlineInputBorder(
                      borderSide: new BorderSide(color: Colors.black)),
                  contentPadding: EdgeInsets.all(8),
                ),
                cursorColor: Colors.black,
                onChanged: (value) {
                  updateController.email = value;
                }),
          ),
          Padding(
            padding: const EdgeInsets.all(25.0),
            child: TextFormField(
                decoration: InputDecoration(
                  hintText: "Address",
                  focusedBorder: OutlineInputBorder(
                      borderSide: new BorderSide(color: Colors.black)),
                  border: OutlineInputBorder(
                      borderSide: new BorderSide(color: Colors.black)),
                  contentPadding: EdgeInsets.all(8),
                ),
                cursorColor: Colors.black,
                onChanged: (value) {
                  updateController.address = value;
                }),
          ),
          const Padding(
            padding: EdgeInsets.all(25.0),
            child: Text(
                "Alternatively, you may email your latest information to info@bmsm.org.my"),
          ),
          ElevatedButton(
              onPressed: () {
                updateController.uploadNewInformation();
                Get.back();
                showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return AlertDialog(title: Text("Information submitted."));
                    });
              },
              child: const Text("Submit"))
        ]),
      ),
    );
  }
}
