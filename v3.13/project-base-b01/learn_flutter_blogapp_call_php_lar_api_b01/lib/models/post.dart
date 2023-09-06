import 'package:learn_flutter_blogapp_call_php_lar_api_b01/models/user.dart';

class Post {
  int? id;
  String? body;
  String? image;
  int? likesCount;
  int? comments_count;
  User? user;
  bool? selfLiked;

  Post({
    this.id,
    this.body,
    this.image,
    this.likesCount,
    this.comments_count,
    this.user,
    this.selfLiked
  });
}