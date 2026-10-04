class Vehicle {
  String brand = "Generic Brand";

  void startEngine() {
    print("Engine Start...");
  }
}

class Car extends Vehicle {
  int wheels = 4;

  void openSource() {
    print("this is open source func");
  }
}

class Parent {
  void advice() {
    print("The function in parent class!");
  }
}

class Child extends Parent {
  @override
  void advice() {
    print("Overide the method advice of parent class in the child class!");
  }
}

void main(List<String> args) {
  // Car myCar = Car();

  // // Child class can access var parent class
  // print(myCar.brand);

  // myCar.startEngine();

  var myWay = Child();
  myWay.advice();
}
