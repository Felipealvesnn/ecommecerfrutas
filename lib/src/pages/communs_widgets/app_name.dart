import 'package:flutter/material.dart';

class AppnameWidget extends StatelessWidget {
  const AppnameWidget({
    super.key,
    this.color,
    this.fontSize = 30,
  });
  final Color? color;
  final double? fontSize;

  @override
  Widget build(BuildContext context) {
    return Text.rich(
      TextSpan(
          style: TextStyle(
            fontSize: fontSize,
            fontWeight: FontWeight.bold,
          ),
          children: [
            TextSpan(
              text: "Frutas",
              style: TextStyle(
                color: color ?? Colors.green,
              ),
            ),
           const TextSpan(
              text: "App",
              style: TextStyle(
                color: Colors.red,
              ),
            ),
          ]),
    );
  }
}
