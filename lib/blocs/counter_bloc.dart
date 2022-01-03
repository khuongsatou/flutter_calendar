import 'package:app_calendar/events/counter_event.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

// abstract class CounterEvent {}

// class CounterIncrementPressed extends CounterEvent {}

// class CounterDecrementPressed extends CounterEvent {}

class CounterBloc extends Bloc<CounterEvent, int> {
  CounterBloc() : super(0) {
    // on<CounterIncrementPressed>((event, emit) => emit(state + 1));
    // on<CounterDecrementPressed>((event, emit) => emit(state - 1));
  }

  // emit -> action.
  // state -> state current
  void increment() => emit(state + 1);
  void decrement() => emit(state - 1);
}
