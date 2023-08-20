import 'package:flutter/material.dart';
import 'package:l_pro_flu_base_v_3_13_b01/pages/home_page.dart';
import 'package:l_pro_flu_base_v_3_13_b01/pages/login_page.dart';
import 'package:l_pro_flu_base_v_3_13_b01/pages/main_page.dart';
import 'package:l_pro_flu_base_v_3_13_b01/styles/app_colors.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        fontFamily: "Urbanist",
        scaffoldBackgroundColor: AppColors.background,
        brightness: Brightness.dark,
      ),
      // home: TestPage(),
      initialRoute: "/",
      routes: {
        '/': (context) => LoginPage(),
        '/home': (context) => HomePage(),
        '/main': (context) => MainPage(),
      },
    );
  }
}
