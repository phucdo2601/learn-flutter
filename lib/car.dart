class Car {
  String name;
  int yearOfProduction;

  // Car(String name, int yearOfProduction) {
  //   this.name = name;
  //   this.yearOfProduction = yearOfProduction;
  // }

  //New way for generate contructor
  // Car(this.name, this.yearOfProduction);

  //ctor with named argument
  Car({required this.name, this.yearOfProduction = 2021});

  @override
  String toString() {
    return '${this.name} - ${this.yearOfProduction}';
  }

  void doSomething(){
    print('I am do sthing!');
    // this.handleEvent();
  }

  void sayHello({required String personName}) {
    print('Hello $personName');
    // _doSomething();
  }

  //function as variable
  // Function handleEvent;
}
