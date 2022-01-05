import 'package:flutter/material.dart';
import 'package:myapp/calculation.dart';
import 'package:myapp/car.dart';


void main() {
  //classical way of iterating
  // for(int i = 0; i <numbers.length; i++) {
  //   print(numbers[i]);
  // }

  // numbers.forEach((element) {
  //   print(element);
  // });

  stringNumbers.forEach((element) {
    print(element);
  });


  //How to init an obj
  var myCar = Car(
      name: "Mercedes-Mayback-S-Class",
      yearOfProduction: 2019 //flutter style
  );

  // myCar._doSomething();//_doSomething is private method
  myCar.sayHello(personName:"PhucDo");


  runApp(Center(child: Text( //chi hien thong tin cac sau ki tu
      '${myCar.toString()}',
      //font size
      style: TextStyle(fontSize: 30),
      textDirection: TextDirection.ltr//left to right

  ), //Text, Center
  ));
}


