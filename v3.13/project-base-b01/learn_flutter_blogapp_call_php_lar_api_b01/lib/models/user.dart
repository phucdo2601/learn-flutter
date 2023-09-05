class User {
  int? id;
  String? image;
  String? name;
  String? email;
  String? token;

  User({this.id, this.name, this.image, this.email, this.token});

  //function to convert json to user model
  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      id: json['user']['id'],
      name: json['user']['name'],
      image: json['user']['image'],
      email: json['user']['email'],
      token: json['token'],
    );
  }
}