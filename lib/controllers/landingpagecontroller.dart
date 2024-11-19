import 'package:get/get.dart';

class Landingpagecontroller extends GetxController{
  //posisi terakhir
  var selectedindex = 0.obs;

  //pindah menu
  void changeMenu(int index) {
    selectedindex.value = index;
  }
}