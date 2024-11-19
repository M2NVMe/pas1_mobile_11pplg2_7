import 'package:flutter/material.dart';

class myButton extends StatelessWidget {
  final Widget textButton;
  final Color backgroundColor;
  final Color textColor;
  final double radius;
  final double elevation;
  final VoidCallback? onPressed; // Allow nullable for disabled state

  const myButton({
    super.key,
    required this.textButton,
    required this.backgroundColor,
    required this.textColor,
    required this.radius,
    required this.elevation,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        backgroundColor: backgroundColor,
        foregroundColor: textColor,
        elevation: elevation,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(radius),
        ),
      ),
      child: textButton,
    );
  }
}
