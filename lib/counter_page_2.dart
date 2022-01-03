import 'package:app_calendar/blocs/counter_bloc.dart';
import 'package:app_calendar/events/counter_event.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CounterPage2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<CounterBloc, int>(
        builder: (context, count) => Center(
          child: Container(
            child: Column(
              children: [
                Text('$count'),
                TextButton(
                  onPressed: () {
                    context.read<CounterBloc>().increment();
                  },
                  child: Text("Increment"),
                ),
                TextButton(
                  onPressed: () {
                    context.read<CounterBloc>().decrement();
                  },
                  child: Text("Decrement"),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
