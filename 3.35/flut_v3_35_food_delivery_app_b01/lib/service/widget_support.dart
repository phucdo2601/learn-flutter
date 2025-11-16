import 'package:flutter/material.dart';

class AppWidget {
  static TextStyle HeadlineFieldStyle() {
    return TextStyle(
      color: Colors.black,
      fontSize: 30.0,
      fontWeight: FontWeight.bold,
    );
  }

  static TextStyle SimpleTextFieldStyle() {
    return TextStyle(color: Colors.black, fontSize: 18.0);
  }

  static TextStyle whiteTextFieldStyle() {
    return TextStyle(
      color: Colors.white,
      fontSize: 18.0,
      fontWeight: FontWeight.bold,
    );
  }

  static TextStyle boldTextFieldStyle() {
    return TextStyle(
      color: Colors.black,
      fontSize: 18,
      fontWeight: FontWeight.bold,
    );
  }
}
