import 'package:app_calendar/blocs/comment_bloc.dart';
import 'package:app_calendar/events/comment_event.dart';
import 'package:app_calendar/infinite_list_2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class InfiniteApp2 extends StatelessWidget {
  const InfiniteApp2({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) {
        return CommentBloc()..add(CommentFetchEvent());
      },
      child: InfiniteList2(),
    );
  }
}
