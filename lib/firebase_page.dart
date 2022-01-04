import 'package:app_calendar/reponsitories/user_reponsitory.dart';
import 'package:flutter/material.dart';

class FirebasePage extends StatefulWidget {
  const FirebasePage({Key? key}) : super(key: key);

  @override
  _FirebasePageState createState() => _FirebasePageState();
}

class _FirebasePageState extends State<FirebasePage> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    final userResponsitory = UserReponsitory();
    userResponsitory.createUserWithEmailAndPassword(
        "vankhuong240499@gmail.com", "123456");
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: Text("123"),
      ),
    );
  }
}
