import 'package:flutter/material.dart';
import 'package:learn_basic_nav_b01/models/agrument_screen.dart';
import 'package:learn_basic_nav_b01/screeens/detail_screen.dart';

class MyHomePage extends StatelessWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
            "Home Page"
        ),
      ),

      body: Center(
        child: Container(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(
                  onPressed: (){
                    Navigator.pushNamed(
                        context,
                        DetailScreen.nameRoute,
                        arguments: ArgumentScreen("Title 1", "Content 1"),
                    );
                  },
                  child: const Text(
                    "Item 1"
                  ),
              ),
              SizedBox(
                height: 30,
              ),
              ElevatedButton(
                onPressed: (){
                  Navigator.pushNamed(
                    context,
                    DetailScreen.nameRoute,
                    arguments: ArgumentScreen("Title 2", "Content 2"),
                  );
                },
                child:  const Text(
                    "Item 2"
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
