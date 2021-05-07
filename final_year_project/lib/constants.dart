import 'package:flutter/material.dart';

const TextFieldStyle = InputDecoration(
  hintText: 'Type Here',
  contentPadding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
  border: OutlineInputBorder(
    borderRadius: BorderRadius.all(Radius.circular(32.0)),
  ),
  enabledBorder: OutlineInputBorder(
    borderSide: BorderSide(color: Colors.lightGreen, width: 1.0),
    borderRadius: BorderRadius.all(Radius.circular(32.0)),
  ),
  focusedBorder: OutlineInputBorder(
    borderSide: BorderSide(color: Colors.lightGreen, width: 2.0),
    borderRadius: BorderRadius.all(Radius.circular(32.0)),
  ),
);

var sendButtonStyle = TextStyle(
  color: Colors.green.shade300,
  fontWeight: FontWeight.bold,
  fontSize: 18.0,
);

const textFieldStyle = InputDecoration(
  contentPadding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
  hintText: 'Type your response here...',
  border: InputBorder.none,
);

var textContainerStyle = BoxDecoration(
  border: Border(
    top: BorderSide(color: Colors.green.shade300, width: 2.0),
  ),
);
