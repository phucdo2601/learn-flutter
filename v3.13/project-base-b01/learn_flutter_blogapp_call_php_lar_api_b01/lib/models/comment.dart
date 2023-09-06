import 'package:learn_flutter_blogapp_call_php_lar_api_b01/models/user.dart';

class Comment {
  int? id;
  String? comment;
  User? user;

  Comment({
    this.id,
    this.comment,
    this.user
  });
}