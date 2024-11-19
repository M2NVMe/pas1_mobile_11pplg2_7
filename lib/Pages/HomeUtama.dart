import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pas1_mobile_11pplg2_7/Pages/Fragments/Favorites.dart';
import 'package:pas1_mobile_11pplg2_7/Pages/Fragments/Home.dart';
import 'package:pas1_mobile_11pplg2_7/Pages/Fragments/Profile.dart';
import 'package:pas1_mobile_11pplg2_7/controllers/landingpagecontroller.dart';

class Homeutama extends StatelessWidget {
  const Homeutama({super.key});

  @override
  Widget build(BuildContext context) {
    final Landingpagecontroller controller = Get.put(Landingpagecontroller());
    final List<Widget> pages = [
      Home(),
      Favorites(),
      Profile()
    ];
    return Scaffold(
      body: Obx(() => pages[controller.selectedindex.value]),
      bottomNavigationBar: Obx(() =>
          BottomNavigationBar(
              type: BottomNavigationBarType.fixed,
              currentIndex: controller.selectedindex.value,
              onTap: controller.changeMenu,
              items: const [
                BottomNavigationBarItem(
                  icon: Icon(Icons.home_rounded, color: Colors.black),
                  label: "Home",
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.star, color: Colors.black),
                  label: "Favorites",
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.person, color: Colors.black),
                  label: "Profile",
                ),
              ])
      ),
    );
  }
}
