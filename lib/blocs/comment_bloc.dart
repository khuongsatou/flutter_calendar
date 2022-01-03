import 'package:app_calendar/events/comment_event.dart';
import 'package:app_calendar/services/services.dart';
import 'package:app_calendar/states/comment_states.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CommentBloc extends Bloc<CommentEvent, CommentState> {
  // ignore: non_constant_identifier_names
  final int NUM_OF_COMMENT_PER_PAGE = 20;

  CommentBloc() : super(CommentStateInitial()) {
    on<CommentFetchEvent>(checkLoadMore);
  }

  Future<void> checkLoadMore(
      CommentFetchEvent event, Emitter<CommentState> emit) async {
    final hasReachedEndOfOnePage = (state is CommentStateSuccess) &&
        (state as CommentStateSuccess).hasReachedEnd;
    try {
      // ignore: unnecessary_type_check
      if (event is CommentFetchEvent && !hasReachedEndOfOnePage) {
        if (state is CommentStateInitial) {
          final comments = await getCommentsFromApi(0, NUM_OF_COMMENT_PER_PAGE);

          emit(CommentStateSuccess(comments: comments, hasReachedEnd: false));
        } else if (state is CommentStateSuccess) {
          // Load next page
          // if page next emtpy => set hasReachedEnd = true.
          final CommentStateSuccess currentState = state as CommentStateSuccess;

          final int finalIndexOfCurrentPage =
              (state as CommentStateSuccess).comments.length;
          final comments = await getCommentsFromApi(
              finalIndexOfCurrentPage, NUM_OF_COMMENT_PER_PAGE);
          if (comments.isEmpty) {
            emit(currentState.cloneWith(hasReachedEnd: true));
          } else {
            // not empty , means "not reached end"
            emit(CommentStateSuccess(
                comments: currentState.comments + comments,
                hasReachedEnd: false));
          }
        }
      }
    } catch (expection) {
      emit(CommentStateFailure());
    }
  }
}
