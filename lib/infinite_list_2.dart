import 'package:app_calendar/blocs/comment_bloc.dart';
import 'package:app_calendar/events/comment_event.dart';
import 'package:app_calendar/infinite_page.dart';
import 'package:app_calendar/states/comment_states.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:app_calendar/services/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class InfiniteList2 extends StatefulWidget {
  const InfiniteList2({Key? key}) : super(key: key);

  @override
  _InfiniteList2State createState() => _InfiniteList2State();
}

class _InfiniteList2State extends State<InfiniteList2> {
  _InfiniteList2State();

  final _scrollControler = ScrollController();
  final _scrollThreadhold = 250.0;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    _scrollControler.addListener(() {
      final maxScrollExtent = _scrollControler.position.maxScrollExtent;
      final currentScroll = _scrollControler.position.pixels;
      if (kDebugMode) {
        print("In File: infinite_list_2.dart, Line: 30 ${maxScrollExtent} ");
      }
      if (kDebugMode) {
        print("In File: infinite_list_2.dart, Line: 34 ${currentScroll} ");
      }
      if (maxScrollExtent - currentScroll <= _scrollThreadhold) {
        context.read<CommentBloc>().add(CommentFetchEvent());
      }
    });
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _scrollControler.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: BlocBuilder<CommentBloc, CommentState>(
          builder: (context, state) {
            // Handle List
            if (state is CommentStateInitial) {
              return Center(
                child: CircularProgressIndicator(),
              );
            }
            if (state is CommentStateFailure) {
              return Center(
                child: Text(
                  'Cannot load comments from server',
                  style: TextStyle(fontSize: 22, color: Colors.red),
                ),
              );
            }

            if (state is CommentStateSuccess) {
              final currentState = state as CommentStateSuccess;
              if (currentState.comments.isEmpty) {
                return Center(
                  child: Text('Emtpy comments...'),
                );
              }

              return ListView.builder(
                itemCount: state.hasReachedEnd
                    ? state.comments.length
                    : currentState.comments.length + 1,
                itemBuilder: (context, index) {
                  if (index >= state.comments.length) {
                    return Container(
                      alignment: Alignment.center,
                      child: Center(
                        child: SizedBox(
                          width: 50,
                          height: 50,
                          child: CircularProgressIndicator(
                            strokeWidth: 1.5,
                          ),
                        ),
                      ),
                    );
                  }

                  return ListTile(
                    title: Text(
                      "title ${state.comments[index].id}",
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                    leading: Text("$index"),
                    subtitle: Text("Content ${state.comments[index].name}"),
                    isThreeLine: true,
                  );
                },
                controller: _scrollControler,
              );
            }

            return Center(
              child: Text('Other states..'),
            );
          },
        ),
      ),
    );
  }
}
