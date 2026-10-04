class Student {
  String name;
  int age;

  Student(this.name, this.age);

  @override
  String toString() {
    // TODO: implement toString
    return "Student Record: [Name: $name, Age: $age]";
  }
}

void main(List<String> args) {
  var s1 = Student("Phucdn", 26);
  print(s1);
}
