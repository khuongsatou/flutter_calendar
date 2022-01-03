import 'package:app_calendar/events/counter_event.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:app_calendar/events/counter_event.dart';

class CounterBloc extends Bloc<CounterEvent, int> {
  CounterBloc() : super(0);

  // emit -> action.
  // state -> state current
  void increment() => emit(state + 1);
  void decrement() => emit(state - 1);
}
