import 'package:flutter/material.dart';


void main() {
  //Center is a widget, Text is a widget

  runApp(
    MyApp(name: "Hoang",age: 22) //How to send arguments/params
  );
}

class MyApp extends StatelessWidget {
  //Private: thay doi thi giao dien thay doi theo
  //StatelessWidget: widget which donot have "state" (property) which has been changed <-> User Interface

  String name;
  int age;

  MyApp({required this.name, required this.age});

  @override
  Widget build(BuildContext context) {
    // build abstract method from parent class(StatelessWidget)
    // return Center(child: Text( //chi hien thong tin cac sau ki tu
    //     "Hello User, name: ${this.name}, age: ${this.age}",
    //     //font size
    //     style: TextStyle(fontSize: 30),
    //     textDirection: TextDirection.ltr//left to right
    //
    // ), //Text, Center
    // );

    return MaterialApp(
      title: "This is my first app!",
      home: Scaffold(
        body: Center(child: Text( //chi hien thong tin cac sau ki tu
            "Hello Username, name: ${this.name}, age: ${this.age}",
            //font size
            style: TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.bold,
                color: Colors.red
            ),
            textDirection: TextDirection.ltr//left to right

          ), //Text, Center
        ),
      )
    );
  }
}


