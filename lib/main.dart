import 'package:app_calendar/blocs/counter_bloc.dart';
import 'package:app_calendar/counter_app.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'counter_page_2.dart';

void main() {
  runApp(
    MaterialApp(
      title: "Transaction app",
      // home: BlocProvider(
      //   create: (context) => CounterBloc(),
      //   child: CounterApp(),
      // ),
      home: CounterApp(),
      theme: ThemeData(
        fontFamily: 'Licorice-Regular',
        primarySwatch: Colors.red,
        // primarySwatch: Color.pink[]
      ),
    ),
  );
}
