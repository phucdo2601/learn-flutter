import 'package:flutter/material.dart';
import 'package:re_learn_flutter_wid_2026_b01/presentation/learn_widgets.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(home: LearnWidget());
  }
}
