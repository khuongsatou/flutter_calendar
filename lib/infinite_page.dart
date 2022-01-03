import 'package:app_calendar/models/comment.dart';
import 'package:app_calendar/services/services.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class InfinitePage extends StatefulWidget {
  InfinitePage();

  @override
  _InfinitePageState createState() => _InfinitePageState();
}

class _InfinitePageState extends State<InfinitePage> {
  late Future<List<Comment>> futureComment;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    futureComment = getCommentsFromApi(1, 20);
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<Comment>>(
      future: futureComment,
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          return ListView.builder(
              itemCount: snapshot.data?.length,
              itemBuilder: (context, index) {
                Comment comment = snapshot.data![index] as Comment;
                return ListTile(
                  title: Text(
                    "title ${comment.name}",
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  leading: Text("$index"),
                  subtitle: Text("Content"),
                  isThreeLine: true,
                );
              });
        } else {
          return Text('${snapshot.error}');
        }
      },
    );
  }
}
