class MyUserEntity {
  String userId;
  String email;
  String name;
  bool hasActivateCart;

  MyUserEntity(
      {required this.userId,
        required this.email,
        required this.name,
        required this.hasActivateCart});

  Map<String, Object?> toDocument() {
    return {
      'userId': userId,
      'email': email,
      'name': name,
      'hasActivateCart': hasActivateCart
    };
  }

  static MyUserEntity fromDocument(Map<String, dynamic> doc) {
    return MyUserEntity(userId: doc['userId'], email: doc['email'], name: doc['name'], hasActivateCart: doc['hasActivateCart']);
  }
}