import 'package:flutter/material.dart';

class InfoButton extends StatelessWidget {
  final String text;
  final Function onPressed;

  InfoButton({
    this.text,
    this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return OutlinedButton(
      child: Text(
        text,
      ),
      style: ButtonStyle(
        padding: MaterialStateProperty.all<EdgeInsets>(
            EdgeInsets.symmetric(vertical: 16.0)),
        backgroundColor:
            MaterialStateProperty.all<Color>(Colors.green.shade300),
        foregroundColor: MaterialStateProperty.all<Color>(Colors.white),
        overlayColor: MaterialStateProperty.all<Color>(Colors.green.shade600),
      ),
      onPressed: onPressed,
    );
  }
}
