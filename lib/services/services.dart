import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import 'package:app_calendar/models/comment.dart';

Future<List<Comment>> getCommentsFromApi(int start, int limit) async {
  Uri url = Uri.parse(
      "https://jsonplaceholder.typicode.com/comments?_start=$start&_limit=$limit");
  List<Comment> comments = [];
  try {
    var response = await http.get(url);

    if (response.statusCode == 200) {
      List responseData = json.decode(response.body) as List;
      comments = responseData
          .map(
            (json) => Comment(
                id: json['id'],
                name: json['name'],
                email: json['email'],
                body: json['body'],
                postId: json['postID']),
          )
          .toList();

      return comments;
    }
    if (response.statusCode == 500) {
      return comments;
    }
    // ignore: empty_catches
  } catch (exception) {}
  return comments;
}
