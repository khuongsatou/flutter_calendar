import 'package:app_calendar/events/authentication_event.dart';
import 'package:app_calendar/reponsitories/user_reponsitory.dart';
import 'package:app_calendar/states/authentication_states.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AuthenticationBloc
    extends Bloc<AuthenticationEvent, AuthenticationState> {
  UserReponsitory userReponsitory;
  AuthenticationBloc({required this.userReponsitory})
      : super(AuthenticationStateInitial()) {
    on<AuthenticationEventStarted>(_checkAuthenUser);
  }

  Future<void> _checkAuthenUser(AuthenticationEvent authenticationEvent,
      Emitter<AuthenticationState> emit) async {
    if (authenticationEvent is AuthenticationEventStarted) {
      final isSignedIn = await userReponsitory.isSignIn();
      if (isSignedIn) {
        final firebaseUser = await userReponsitory.getUser();
        emit(AuthenticationStateSuccess(firebaseUser: firebaseUser));
      } else {
        emit(AuthenticationStateFailure());
      }
    } else if (authenticationEvent is AuthenticationEventLoggedIn) {
      emit(AuthenticationStateSuccess(
          firebaseUser: await userReponsitory.getUser()));
    }
  }
}
