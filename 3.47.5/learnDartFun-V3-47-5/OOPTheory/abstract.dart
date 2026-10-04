abstract class Applicance {
  void turnOn();

  void brandMessage() {
    print("Quatity is our property!");
  }
}

class Fan extends Applicance {
  @override
  void turnOn() {
    print("Turn on the fan");
  }
}

void main(List<String> args) {
  var myFan = Fan();
  myFan.turnOn();
  myFan.brandMessage();
}
