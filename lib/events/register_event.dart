import 'package:equatable/equatable.dart';

abstract class RegisterEvent extends Equatable {
  @override
  // TODO: implement props
  List<Object?> get props => [];
}

class RegisterEventEmailChanged extends RegisterEvent {
  final String email;
  RegisterEventEmailChanged({required this.email});

  List<Object?> get props => [email];

  @override
  String toString() {
    // TODO: implement toString
    return 'Email changed $email';
  }
}

class RegisterEventPasswordChanged extends RegisterEvent {
  final String password;
  RegisterEventPasswordChanged({required this.password});

  List<Object?> get props => [password];

  @override
  String toString() {
    // TODO: implement toString
    return 'Password changed $password';
  }
}

class RegisterEventWithGooglePressed extends RegisterEvent {}

class RegisterEventWithEmailAndPasswordPressed extends RegisterEvent {
  final String email;
  final String password;
  RegisterEventWithEmailAndPasswordPressed(
      {required this.email, required this.password});

  List<Object?> get props => [email, password];

  @override
  String toString() {
    // TODO: implement toString
    return 'Email changed $email Password changed $password';
  }
}
