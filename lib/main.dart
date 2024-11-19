import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pas1_mobile_11pplg2_7/LoginPage.dart';
import 'package:pas1_mobile_11pplg2_7/Pages/HomeUtama.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  //////////////////////////////////////////////////////////////////////////////////////////

  //README FIRST!!!!
  //Sedikit rawan bug, tetapi sudah lumayan dibanding attempt sebelumnya, namun masih tetap banyak bug, klo mau ganti sesuatu baca bismilah dulu
  //Untuk token mungkin akan di implementasikan di kemudian hari di karenakan waktu tidak cukup (90% waktu habis untuk bugfix (sisanya untuk features dan ui) + saya belum 100% paham dengan materi token tersebut)

  //////////////////////////////////////////////////////////////////////////////////////////

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
