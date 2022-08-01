import 'package:flutter/material.dart';
import 'package:learn_basic_nav_b01/screeens/detail_screen.dart';
import 'package:learn_basic_nav_b01/screeens/first_route.dart';
import 'package:learn_basic_nav_b01/screeens/my_home_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Navigation Demo',
      debugShowCheckedModeBanner: false,
      // home: FirstRoute(),
      home: const MyHomePage(),
      /**
       * tao mot list cac route de di chuyen trong app
       */
      routes: {
        DetailScreen.nameRoute : (context) => const DetailScreen(),

      },
    );
  }
}

