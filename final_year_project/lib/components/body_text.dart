import 'package:flutter/material.dart';

class BodyText extends StatelessWidget {
  final String text;

  BodyText(this.text);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
        color: Colors.grey.shade700,
        fontSize: 15.0,
        fontWeight: FontWeight.w300,
      ),
    );
  }
}
