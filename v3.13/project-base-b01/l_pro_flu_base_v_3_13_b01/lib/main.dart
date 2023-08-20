import 'package:flutter/material.dart';
import 'package:l_pro_flu_base_v_3_13_b01/config/app_routes.dart';
import 'package:l_pro_flu_base_v_3_13_b01/styles/app_colors.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        fontFamily: "Urbanist",
        scaffoldBackgroundColor: AppColors.background,
        brightness: Brightness.dark,
      ),
      // home: TestPage(),
      initialRoute: AppRoutes.login,
      routes: AppRoutes.pages,
    );
  }
}
