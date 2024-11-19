import 'dart:io';

import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:pas1_mobile_11pplg2_7/Reuses/myButton.dart';

class Profile extends StatelessWidget {
  const Profile({super.key});

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Container(
          child: Column(
            children: [
              SizedBox(height: 0),
              Center(
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(25),
                  child: Container(
                    width: width,
                    height: 280,
                    color: Color.fromARGB(200, 194, 194, 194),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(Icons.person, size: 70),
                        SizedBox(height: 20),
                        Text(
                          "User",
                          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              SizedBox(height: 400), // Adjusted spacing
              SizedBox(
                width: 200,
                child: myButton(
                  textButton: Text("Logout", style: TextStyle(fontWeight: FontWeight.w400, fontSize: 20),),
                  backgroundColor: Colors.black,
                  textColor: Colors.white,
                  radius: 8,
                  elevation: 0,
                  onPressed: () {
                    exit(0);
                  },
                ),
              ),
              SizedBox(height: 70), // Bottom padding
            ],
          ),
        ),
      ),
    );
  }
}
