import 'package:flutter/material.dart';
import 'package:learn_basic_nav_b01/models/agrument_screen.dart';

class DetailScreen extends StatelessWidget {
  static const nameRoute = "/Detail";

  const DetailScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final args = ModalRoute.of(context)!.settings.arguments as  ArgumentScreen;
    return Scaffold(
      appBar: AppBar(
        title: Text(
          args.title
        ),
      ),

      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              args.title
            ),
          ],
        ),
      ),
    );
  }
}
