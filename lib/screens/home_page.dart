import 'package:flutter/material.dart';

class HomePageTest01 extends StatefulWidget {
  const HomePageTest01({Key? key}) : super(key: key);

  @override
  State<HomePageTest01> createState() => _HomePageTest01State();
}

class _HomePageTest01State extends State<HomePageTest01> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: Text(
          "Hello Home Page"
        ),
      ),
    );
  }
}
