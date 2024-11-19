// login_controller.dart
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pas1_mobile_11pplg2_7/Apis/LoginAPI.dart';


class LoginController extends GetxController {
  var obscure = true.obs;
  var usr = "".obs ;
  var isLoading = false.obs;
  var loginStatus = "".obs;
  var token = "".obs;

  final Loginapiservice _loginService = Loginapiservice();
  void changeObscured(){
    obscure.value = !obscure.value;
  }

  Future<void> login(String username, String password) async {
    isLoading.value = true;
    try {
      final response = await _loginService.login(username, password);
      if (response["status"] == true) {
        loginStatus.value = response["message"];
        token.value = response["token"];
        usr.value = username;
      } else {
        loginStatus.value = "Login failed";
      }
    } catch (e) {
      loginStatus.value = "Error: ${e.toString()}";
    } finally {
      isLoading.value = false;
    }
  }

  //ini fungsinya, biar ga ribet di uinya
  Future<void> LoggerIn(
      TextEditingController usernameController, TextEditingController passwordController) async {
    if (isLoading.value) return;

    final username = usernameController.text;
    final password = passwordController.text;

    if (username.isEmpty || password.isEmpty) {
      Get.snackbar("Error", "Please fill the username and password fields");
      return;
    }

    await login(username, password);

    if (loginStatus.value == "Login success") {
      Get.toNamed('/home');
      Get.snackbar("Success", "Username and Password are correct");
    } else if (loginStatus.value == "Login failed") {
      Get.snackbar("Error", "Incorrect password or username");
    } else {
      Get.snackbar("Error", loginStatus.value);
    }
  }
}
