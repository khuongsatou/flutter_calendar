import 'package:app_calendar/firebase_page.dart';
import 'package:flutter/material.dart';

import 'package:firebase_core/firebase_core.dart';

class FirebaseApp extends StatelessWidget {
  const FirebaseApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: Firebase.initializeApp(),
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            return Text("Error...");
          }
          if (snapshot.connectionState == ConnectionState.done) {
            return FirebasePage();
          }

          return Text("Loading...");
        });
  }
}
