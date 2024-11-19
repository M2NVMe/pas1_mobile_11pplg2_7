import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pas1_mobile_11pplg2_7/Reuses/TextFieldNEW.dart';
import 'package:pas1_mobile_11pplg2_7/Reuses/myButton.dart';
import 'package:pas1_mobile_11pplg2_7/controllers/logincontrol.dart';

class Loginpage extends StatelessWidget {
  Loginpage({super.key});

  @override
  Widget build(BuildContext context) {
    final LoginController loginController = Get.put(LoginController());
    final TextEditingController usernameController = TextEditingController();
    final TextEditingController passwordController = TextEditingController();
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child:
        Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Expanded(child: Container()),
              Text(
                "Login Page",
                style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 40),
              myTextField(
                  isObscure: false,
                  textStyle: TextStyle(fontSize: 12),
                  controller: usernameController,
                  textInputType: TextInputType.text,
                  inputDecoration: InputDecoration(
                    labelText: "Username",
                    border: OutlineInputBorder(),
                    prefixIcon: Icon(Icons.person),
                  )),
              Obx(() => myTextField(
                  isObscure: loginController.obscure.value,
                  textStyle: TextStyle(fontSize: 12),
                  controller: passwordController,
                  textInputType: TextInputType.text,
                  inputDecoration: InputDecoration(
                    labelText: "Password",
                    border: OutlineInputBorder(),
                    prefixIcon: Icon(Icons.lock),
                    suffixIcon: IconButton(
                      icon: Icon(loginController.obscure.value
                          ? Icons.visibility_off
                          : Icons.visibility),
                      onPressed: loginController.changeObscured,
                    ),
                  )),),
              SizedBox(height: 20),
              Obx(() =>
                  myButton(
                textButton: const Text("Login"),
                backgroundColor: Colors.black,
                textColor: Colors.white,
                radius: 5,
                elevation: 0,
                onPressed: loginController.isLoading.value
                    ? null
                    : () {
                  loginController.LoggerIn(
                      usernameController, passwordController);
                },
              )),
              Expanded(child: Container()),
            ],
          ),
        ),
      );
  }
}
