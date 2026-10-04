abstract class Shape {
  void draw();

  factory Shape(String type) {
    if (type == 'circle') {
      return Circle();
    } else if (type == 'square') {
      return Square();
    } else {
      throw 'Unknow share type';
    }
  }
}

class Circle implements Shape {
  @override
  void draw() {
    print("Drawing Cicrle!");
  }
}

class Square implements Shape {
  @override
  void draw() {
    print("Drawing Square!");
  }
}

void main(List<String> args) {
  var myshape = Shape("circle");
  myshape.draw();
}
