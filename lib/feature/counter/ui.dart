import 'package:bloc_counter_app/feature/counter/bloc/counter_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CounterScreen extends StatelessWidget {
  const CounterScreen({super.key});


  @override
  Widget build(BuildContext context) {
    final counterBloc = CounterBloc();
    return BlocConsumer<CounterBloc, CounterState>(
      bloc: counterBloc,
      listenWhen: (previous, current) => current is CounterActionState,
      buildWhen: (previous, current) => current is! CounterActionState,
      listener: (context, state) {
        if (state is ShowSnackBarState) {
          ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
              duration: Duration(milliseconds: 200),
              content: Text(
                  "The app doesn't rebuilt it just listened to the non action  state emitted ")));
        }
      },
      builder: (context, state) {
        return Scaffold(
          floatingActionButton: FloatingActionButton(
            backgroundColor: Colors.teal,
            onPressed: () {
              counterBloc.add(CounterValueIncrementEvent());
            },
            child: const Icon(Icons.add),
          ),
          appBar: AppBar(
            actions: [
              IconButton(
                  onPressed: () {
                    counterBloc.add(ShowSnackBarEvent());
                  },
                  icon: const Icon(Icons.info_outline))
            ],
            backgroundColor: Colors.teal,
            title: const Text("Counter App"),
          ),
          body: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const Text("counter value is shown below"),
                Text(
                  counterBloc.count.toString(),
                  style: const TextStyle(
                      fontSize: 70, fontWeight: FontWeight.w300),
                )
              ],
            ),
          ),
        );
      },
    );
  }
}
