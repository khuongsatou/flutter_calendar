import 'package:equatable/equatable.dart';

abstract class LoginEvent extends Equatable {
  @override
  // TODO: implement props
  List<Object?> get props => [];
}

class LoginEventEmailChanged extends LoginEvent {
  final String email;
  LoginEventEmailChanged({required this.email});

  List<Object?> get props => [email];

  @override
  String toString() {
    // TODO: implement toString
    return 'Email changed $email';
  }
}

class LoginEventPasswordChanged extends LoginEvent {
  final String password;
  LoginEventPasswordChanged({required this.password});

  List<Object?> get props => [password];

  @override
  String toString() {
    // TODO: implement toString
    return 'Password changed $password';
  }
}

class LoginEventWithGooglePressed extends LoginEvent {}

class LoginEventWithEmailAndPasswordPressed extends LoginEvent {
  final String email;
  final String password;
  LoginEventWithEmailAndPasswordPressed(
      {required this.email, required this.password});

  List<Object?> get props => [email, password];

  @override
  String toString() {
    // TODO: implement toString
    return 'Email changed $email Password changed $password';
  }
}
