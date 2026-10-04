class Box<T> {
  T content;

  Box(this.content);

  void showContent() {
    print("This content in box: $content (Type: ${content.runtimeType})");
  }
}

void main(List<String> args) {
  var stringBox = Box("Secret Letter!");

  stringBox.showContent();

  var intBox = Box<int>(100);
  intBox.showContent();
}
