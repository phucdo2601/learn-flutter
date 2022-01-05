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

  //Now we try with final and const(constant)
  //final co the them mot phan tu vao
  // final List<int> someNumbers = [1,2,3,5]; // const va final khi tao ra thi khong tam chieu dc nua
  //const thi khong cho them mot ki tu, giong nhu mot list mac dinh
  // const List<int> someNumbers = [1,2,3,5];
  // final List<int> someNumbers = [1,2,3,5];
  // someNumbers.add(8);
  // someNumbers[0] = 99; // you can update the value in final array
  final List<int> someNumbers = [1,2,3,5];
  // someNumbers[0] = 99;// you can not update the value in final array
  //now reference to a const list
  // khi mot thang khac tham chieu den const List thi cung khong the thay doi kieu gia tri
  //Nguoc lai final thi dc
  List<int> someNumbers2 = someNumbers;
  someNumbers2.add(123);
  someNumbers2 = [4,7,9]; // you can reference someNumber2 another array after reference to a 'final

  //you can define an object without creating class
  Map<String, dynamic> personA = Map();
  personA['name'] = "hoang";
  personA['age'] = 19; //you cannot accept int

  Map<double, double> point = Map();
  point[2.0] = 3.2;//x = 2.0, y = 3.2
  point[1.0] =5.6; //Yiu can add many key-value pairs as you like!


  runApp(Center(child: Text( //chi hien thong tin cac sau ki tu
      names.toString(),
      //font size
      style: TextStyle(fontSize: 30),
      textDirection: TextDirection.ltr//left to right

  ), //Text, Center
  ));
}


