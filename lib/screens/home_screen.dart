import 'package:flutter/material.dart';

class HomeScreeen extends StatelessWidget {
  const HomeScreeen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Home Screen"
        ),
      ),

      body: Center(
        child: Text(
          "Welcome to home screen"
        ),
      ),
    );
  }
}
