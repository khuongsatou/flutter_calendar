import 'package:equatable/equatable.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class AuthenticationState extends Equatable {
  @override
  // TODO: implement props
  List<Object?> get props => [];
}

class AuthenticationStateInitial extends AuthenticationState {}

class AuthenticationStateSuccess extends AuthenticationState {
  User? firebaseUser;

  AuthenticationStateSuccess({required this.firebaseUser});

  @override
  // TODO: implement props
  List<Object?> get props => [firebaseUser];

  @override
  String toString() {
    // TODO: implement toString
    return 'AuthenticationStateSuccess is email ${firebaseUser?.email}';
  }
}

class AuthenticationStateFailure extends AuthenticationState {}
