import 'package:flutter/material.dart';
import 'package:learn_basic_nav_b01/screeens/second_route.dart';

class FirstRoute extends StatelessWidget {
  const FirstRoute({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "First Screen"
        ),

      ),
      body: Center(
        child: Container(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                  "Welcome to First Screen!"
              ),

              SizedBox(
                height: 30,
              ),

              ElevatedButton(
                onPressed: (){
                  /**
                   * push la mo ra trang tiep theo dc chi dinh
                   */
                  Navigator.push(context, MaterialPageRoute(builder: (context) => const SecondRoute()));
                },
                child: Text(
                    "Open Second  Screen"
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
