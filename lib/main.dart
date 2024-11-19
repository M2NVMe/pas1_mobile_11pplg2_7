import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pas1_mobile_11pplg2_7/LoginPage.dart';
import 'package:pas1_mobile_11pplg2_7/Pages/HomeUtama.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Flutter Demo',
      initialRoute: '/',
      getPages: [
        GetPage(name: '/', page: () => Loginpage()),
        GetPage(name: '/home', page: () => Homeutama()),
      ],
    );
  }
}
