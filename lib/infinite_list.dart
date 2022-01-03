import 'package:app_calendar/infinite_page.dart';
import 'package:flutter/material.dart';
import 'package:app_calendar/services/services.dart';

class InfiniteList extends StatelessWidget {
  InfiniteList();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: InfinitePage(),
      ),
    );
  }
}
