import 'package:app_calendar/models/comment.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

abstract class CommentState extends Equatable {
  const CommentState();

  @override
  // TODO: implement props
  List<Object?> get props => [];
}

class CommentStateInitial extends CommentState {}

class CommentStateFailure extends CommentState {}

class CommentStateSuccess extends CommentState {
  List<Comment> comments;
  bool hasReachedEnd;
  CommentStateSuccess({required this.comments, required this.hasReachedEnd});

  @override
  String toString() => "comments : $comments, hasReachedEnd: $hasReachedEnd";

  @override
  // TODO: implement props
  List<Object?> get props => [comments, hasReachedEnd];

  // Duplicate object , vì: không thể thay đổi bloc thẳng được nên phải tạo mới
  CommentStateSuccess cloneWith(
      {List<Comment>? comments, required bool hasReachedEnd}) {
    return CommentStateSuccess(
        comments: comments ?? this.comments, hasReachedEnd: hasReachedEnd);
  }
}
