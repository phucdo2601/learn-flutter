import 'package:user_repository/src/entities/entities.dart';

class MyUser {
  String userId;
  String email;
  String name;
  bool hasActivateCart;

  MyUser(
      {required this.userId,
        required this.email,
        required this.name,
        required this.hasActivateCart});

  static final empty =
  MyUser(userId: "", email: "", name: "", hasActivateCart: false);

  MyUserEntity toEntity() {
    return MyUserEntity(
      userId: userId,
      email: email,
      name: name,
      hasActivateCart: hasActivateCart,
    );
  }

  static MyUser fromEntity(MyUserEntity entity) {
    return MyUser(userId: entity.userId, email: entity.email, name: entity.name, hasActivateCart: entity.hasActivateCart);
  }

  @override
  String toString() {
    // TODO: implement toString
    return "MyUser: $userId, $email, $name, $hasActivateCart";
  }
}