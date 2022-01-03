import 'package:equatable/equatable.dart';

// enum CommentEvent { commentFetchedEvent }

abstract class CommentEvent extends Equatable {
  @override
  List<Object> get props => [];
}

class CommentFetchEvent extends CommentEvent {}
