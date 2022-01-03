import 'package:flutter/foundation.dart';

class Comment {
  // {
  //   "postId": 1,
  //   "id": 1,
  //   "name": "id labore ex et quam laborum",
  //   "email": "Eliseo@gardner.biz",
  //   "body": "laudantium enim quasi est quidem magnam voluptate ipsam eos\ntempora quo necessitatibus\ndolor quam autem quasi\nreiciendis et nam sapiente accusantium"
  // },

  int? postId = 0;
  int? id = 0;
  String? name = "";
  String? email = "";
  String? body = "";

  Comment({this.id, this.name, this.email, this.body, this.postId});
}
