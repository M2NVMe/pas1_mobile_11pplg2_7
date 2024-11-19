import 'package:flutter/material.dart';

class myTextField extends StatelessWidget {
  final TextInputType textInputType;
  final TextStyle textStyle;
  final InputDecoration inputDecoration;
  final bool isObscure;
  final TextEditingController? controller;

  const myTextField({super.key, required this.isObscure, required this.textStyle, required this.controller, required this.textInputType, required this.inputDecoration});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(10),

      child: TextField(
        keyboardType: textInputType,
        controller: controller,
        obscureText: isObscure,
        style: textStyle,
        decoration: inputDecoration,
      ),
    );
  }
}
