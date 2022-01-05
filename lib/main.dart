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
  /*var myCar = Car(
      name: "Mercedes-Mayback-S-Class",
      yearOfProduction: 2019 //flutter style
  );

  myCar.doSomething();//_doSomething is private method
  myCar.sayHello(personName:"PhucDo");*/

  //List of cars
  List<Car> cars = <Car>[
    Car(name: "Mercedes Benz C Class amg 2500", yearOfProduction: 2018),
    Car(name: "Mercedes-Maybach S-Class Saloon", yearOfProduction: 2021),
    Car(name: "Mercedes Benz E Class C300", yearOfProduction: 2019)
  ]; //a blank list
  cars.forEach((element) {
    print(element);
  });

  //How to sort this list by year of production
  // cars.sort((car1, car2) => car1.yearOfProduction - car2.yearOfProduction); // sort ascending
  // cars.sort((car1, car2) => car2.yearOfProduction - car1.yearOfProduction); // descending
  // cars.sort((car1, car2) => car1.name.compareTo(car2.name)); //sort string ascending
  // cars.sort((car1, car2) => car2.name.compareTo(car1.name)); //sort string descending

  //How to update item in the list
  cars[0].yearOfProduction =2016;

  //add more items
  cars.add(Car(name: "Mercedes Benz G Class AMG g300", yearOfProduction: 2016));


  //How to filter ? ex: car in 2016
  cars.where((car) => car.yearOfProduction == 2016).toList();
  var filteredCars = cars.where((car) => car.yearOfProduction == 2016 && car.name.toUpperCase().contains("AMG")).toList();

  //delete items = using filter
  cars = cars.where((car) => car.name != "Mercedes Benz G Class AMG g300").toList() ;

  //how to get a list of names ?
  List<String> names = cars.map((car) => car.name).toList();
  names.forEach((element) {
    print('name: ${names}');
  });

  runApp(Center(child: Text( //chi hien thong tin cac sau ki tu
      names.toString(),
      //font size
      style: TextStyle(fontSize: 30),
      textDirection: TextDirection.ltr//left to right

  ), //Text, Center
  ));
}


