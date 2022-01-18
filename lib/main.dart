import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:bmsm/ui/home.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:bmsm/ui/update.page.dart';
import 'get_bindings.dart';

void main() async {
  await Firebase.initializeApp(
    options: const FirebaseOptions(
      apiKey: "AIzaSyBzTzu6YxKcloSU0_CxPdXkjbolcIlJ0SU",
      appId: "1:757637391386:web:6b5e5c439e93e211231da3",
      messagingSenderId: "757637391386",
      projectId: "dataupdate-site",
      storageBucket: "dataupdate-site.appspot.com",
      measurementId: "G-JYHKELZVQM",
    ),
  );
  GetInitializer().dependencies();
  await Future.delayed(const Duration(milliseconds: 500));
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'BMSM Data Update',
      theme: ThemeData(
        primarySwatch: white,
      ),
      home: Home(),
      // debugShowCheckedModeBanner: false,
      getPages: [
        GetPage(name: "/", page: () => Home()),
        GetPage(name: "/update", page: () => UpdatePage()),
      ],
    );
  }
}

const MaterialColor white = MaterialColor(
  0xFFFFFFFF,
  <int, Color>{
    50: Color(0xFFFFFFFF),
    100: Color(0xFFFFFFFF),
    200: Color(0xFFFFFFFF),
    300: Color(0xFFFFFFFF),
    400: Color(0xFFFFFFFF),
    500: Color(0xFFFFFFFF),
    600: Color(0xFFFFFFFF),
    700: Color(0xFFFFFFFF),
    800: Color(0xFFFFFFFF),
    900: Color(0xFFFFFFFF),
  },
);
